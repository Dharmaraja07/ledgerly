import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_isar.dart';
import 'package:uuid/uuid.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final AuthLocalDatasource local;

  AuthRepositoryImpl(this.remote, this.local);

  // @override
  // Future<User> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     final data = await remote.login(email, password);

  //     final userIsar = UserIsar()
  //       ..userId = data['user']['id']
  //       ..email = data['user']['email']
  //       ..name = data['user']['name']
  //       ..accessToken = data['accessToken']
  //       ..refreshToken = data['refreshToken'];

  //     await local.saveUser(userIsar);

  //     return User(
  //       id: userIsar.userId,
  //       email: userIsar.email,
  //       name: userIsar.name,
  //     );
  //   } catch (_) {
  //     final cached = local.getUser();
  //     if (cached == null) rethrow;

  //     return User(
  //       id: cached.userId,
  //       email: cached.email,
  //       name: cached.name,
  //     );
  //   }
  // }
  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    final normalizedEmail = email.trim().toLowerCase();
    final cached = local.getUser();

    if (cached != null && cached.email.toLowerCase() == normalizedEmail) {
      return User(
        id: cached.userId,
        email: cached.email,
        name: cached.name,
      );
    }

    final displayName = _displayNameFromEmail(normalizedEmail);
    final userIsar = UserIsar()
      ..userId = const Uuid().v4()
      ..email = normalizedEmail
      ..name = displayName
      ..accessToken = 'local-session'
      ..refreshToken = password;

    await local.saveUser(userIsar);

    return User(
      id: userIsar.userId,
      email: userIsar.email,
      name: userIsar.name,
    );
  }

  String _displayNameFromEmail(String email) {
    final localPart = email.split('@').first.trim();
    if (localPart.isEmpty) {
      return 'Ledgerly User';
    }

    return localPart
        .split(RegExp(r'[._-]+'))
        .where((segment) => segment.isNotEmpty)
        .map((segment) => '${segment[0].toUpperCase()}${segment.substring(1)}')
        .join(' ');
  }

  @override
  Future<User?> getCachedUser() async {
    final cached = local.getUser();
    if (cached == null) return null;

    return User(
      id: cached.userId,
      email: cached.email,
      name: cached.name,
    );
  }

  @override
  Future<void> logout() async {
    await local.clear();
  }
}
