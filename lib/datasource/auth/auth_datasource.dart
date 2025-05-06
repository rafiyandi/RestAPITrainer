import 'package:dio/dio.dart';

class AuthDatasource {
  Dio dio = Dio();
  static const host = 'https://reqres.in/api/users';
  static const loginHost = 'https://reqres.in/api/login';

  Future<String> login(
      {required String email, required String password}) async {
    try {
      final response = await dio.post(
        loginHost,
        data: {'email': email, 'password': password},
        options: Options(
          headers: {'x-api-key': 'reqres-free-v1'},
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        String token = response.data['token'];
        return token;
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
