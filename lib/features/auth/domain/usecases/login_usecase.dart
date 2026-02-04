import 'package:ledgerly/features/auth/domain/repositories/auth_repository.dart';

import '../entities/user.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<User> call(String email,String password){
    return repository.login(email: email, password: password);
  }
}
