import 'package:dio/dio.dart';
import '../log/DioLogger.dart';
import '../log/Log.dart';
import 'api_const.dart';

enum RequestType { GET, POST }
enum RequestSerializer { JSON, HTTP }

class BaseRequest {
  String get baseUrl => null;
  String get path => null;
  RequestType get type => RequestType.GET;
  RequestSerializer get requestSerializer => RequestSerializer.JSON;
  Map<String, dynamic> get params => {};
  Map<String, String> get headers => {};
  Future request() async {
    return HttpRequest.instance.request(this);
  }
}

class HttpRequest {
  Dio _dio;
  static const String TAG = 'HttpRequest';
  static const String _baseUrl = APIConst.baseUrl;
  static HttpRequest instance = HttpRequest();

  HttpRequest() {
    if (_dio != null) {
      return;
    }
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
  Future request(BaseRequest request) async {
    try {
      String path = request.path;
      String url = request.baseUrl;
      if (path == null) {
        throw DioError(error: "path cannot be empty");
      }
      final separator = "/";
      if (path.substring(0, 1) != separator) {
        if (url != null) {
          if (url.lastSubString != separator) {
            path = separator + path;
          }
        } else {
          if (_dio.options.baseUrl.lastSubString != separator) {
            path = separator + path;
          }
        }
      }

      RequestOptions ro = RequestOptions()
        ..baseUrl = request.baseUrl
        ..headers = request.headers
        ..contentType = request.requestSerializer == RequestSerializer.HTTP
            ? Headers.formUrlEncodedContentType
            : Headers.jsonContentType
        ..sendTimeout = 20000;

      Response response;
      if (request.type == RequestType.GET) {
        response =
            await _dio.get(path, queryParameters: request.params, options: ro);
      } else if (request.type == RequestType.POST) {
        response = await _dio.post(path, data: request.params, options: ro);
      }
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}

extension StringExtension on String {
  String get lastSubString => this.substring(this.length - 1);
}
