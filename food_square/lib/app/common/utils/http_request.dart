import 'package:dio/dio.dart';
import './log/DioLogger.dart';

import 'log/Log.dart';

class HttpRequest {
  Dio _dio;
  static const String TAG = 'HttpRequest';
  static const String _baseUrl = "http://123.207.32.32:8001/api/";
  static HttpRequest instance = HttpRequest();

  HttpRequest() {
    Log.init();
    BaseOptions dioOptions = BaseOptions()
      ..baseUrl = HttpRequest._baseUrl
      ..sendTimeout = 20000
      ..receiveTimeout = 20000
      ..connectTimeout = 20000;
    _dio = Dio(dioOptions);
    final interceptor = InterceptorsWrapper(onRequest: (options) {
      DioLogger.onSend(TAG, options);
      return options;
    }, onResponse: (Response response) {
      DioLogger.onSuccess(TAG, response);
      return response;
    }, onError: (DioError error) {
      DioLogger.onError(TAG, error);
      return error;
    });
    _dio.interceptors.add(interceptor);
  }
  Future<T> request<T>(String url,
      {String method = "get", Map<String, dynamic> params}) async {
    // 2.发送网络请求
    try {
      Response response = await _dio.request(url);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
