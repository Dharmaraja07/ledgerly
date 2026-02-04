


import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_isar.dart';

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
  final data = await remote.login(email, password);

  final user = data['user'];
  final access = data['access_token'];
  final refresh = data['refresh_token'];

  final userIsar = UserIsar()
    ..userId = user['id']
    ..email = user['email']
    ..name = user['name']
    ..accessToken = access
    ..refreshToken = refresh;

  await local.saveUser(userIsar);

  return User(
    id: userIsar.userId,
    email: userIsar.email,
    name: userIsar.name,
  );
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
