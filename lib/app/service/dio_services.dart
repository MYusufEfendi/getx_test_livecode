import 'package:dio/dio.dart';
import 'package:test_live_code/app/data/models/login_model.dart';
import 'package:test_live_code/app/data/models/users_model.dart';

import 'logging.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://reqres.in/api/",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      connectTimeout: 20000,
      receiveTimeout: 10000,
    ),
  )..interceptors.add(Logging());

  Future<LoginModel?> postLogin(email, password) async {
    LoginModel? res;
    try {
      Response response = await _dio.post(
        'login',
        data: {"email": email, "password": password},
      );
      print('response data: ${response.data}');
      res = LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      res = null;
      print('Error response : $e');
    }
    return res;
  }

  Future<UsersModel?> getUsers() async {
    UsersModel? res;
    try {
      Response response = await _dio.get(
        'users',
      );
      print('response data: ${response.data}');
      res = UsersModel.fromJson(response.data);
    } on DioError catch (e) {
      res = null;
      print('Error response : $e');
    }
    return res;
  }
}
