import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _access = 'access_token';
  static const _refresh = 'refresh_token';

  final _storage = const FlutterSecureStorage();

  Future<void> save(String access, String refresh) async {
    await _storage.write(key: _access, value: access);
    await _storage.write(key: _refresh, value: refresh);
  }

  Future<String?> get access async => _storage.read(key: _access);
  Future<String?> get refresh async => _storage.read(key: _refresh);

  Future<void> clear() async => _storage.deleteAll();
}
