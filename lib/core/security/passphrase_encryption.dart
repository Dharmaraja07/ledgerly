import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as enc;

/// AES-256 envelope for sharing snapshots; passphrase never stored on disk.
class PassphraseEncryption {
  PassphraseEncryption._();

  static const int _version = 1;

  /// Returns a single JSON string safe to write to a file or share.
  static String seal(String plainText, String passphrase) {
    if (passphrase.isEmpty) {
      throw ArgumentError('Passphrase must not be empty');
    }
    final salt = Uint8List.fromList(
      List<int>.generate(16, (_) => Random.secure().nextInt(256)),
    );
    final key = _deriveKey(passphrase, salt);
    final iv = enc.IV.fromSecureRandom(16);
    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return jsonEncode({
      'v': _version,
      'salt': base64Encode(salt),
      'iv': iv.base64,
      'c': encrypted.base64,
    });
  }

  static String open(String sealed, String passphrase) {
    final map = jsonDecode(sealed) as Map<String, dynamic>;
    final salt = Uint8List.fromList(base64Decode(map['salt'] as String));
    final key = _deriveKey(passphrase, salt);
    final iv = enc.IV.fromBase64(map['iv'] as String);
    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
    return encrypter.decrypt(
      enc.Encrypted.fromBase64(map['c'] as String),
      iv: iv,
    );
  }

  static enc.Key _deriveKey(String passphrase, Uint8List salt) {
    final combined = Uint8List(salt.length + utf8.encode(passphrase).length);
    combined.setAll(0, salt);
    combined.setAll(salt.length, utf8.encode(passphrase));
    final hash = sha256.convert(combined);
    return enc.Key(Uint8List.fromList(hash.bytes));
  }
}
