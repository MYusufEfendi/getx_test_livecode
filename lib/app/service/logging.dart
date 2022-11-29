import 'package:dio/dio.dart';
import 'package:get/get.dart' as Getx;

import '../../app/routes/app_pages.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    print(
      'REQUEST[${options.data}] ',
    );
    print(
      'URL [${options.uri}] ',
    );
    print(
      'REQUEST[${options.headers}] ',
    );
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    print(
      'RESPONSE[${response.data}] ',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    /// hadling error
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    print(
      'ERROR[${err.response?.data}] ',
    );

    return super.onError(err, handler);
  }
}
