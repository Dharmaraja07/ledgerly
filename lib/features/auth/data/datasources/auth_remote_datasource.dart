import 'package:dio/dio.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    print('➡️ Calling /auth/login with timeouts: Connect=${dio.options.connectTimeout}, Receive=${dio.options.receiveTimeout}');
    
    try {
      final res = await dio.post(
        'api/v1/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      print('✅ Login response: ${res.data}');
      return res.data;
    } catch (e) {
      print('❌ AuthRemoteDataSource Error: $e');
      rethrow;
    }
  }
}
