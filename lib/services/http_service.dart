import 'package:dio/dio.dart';

class HttpService {
  String _baseUrl = 'https://service-handa.herokuapp.com/';
  late Dio _dio;

  HttpService() {
    var options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _dio = Dio(options);

    initializeInterceptors();
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, errorInterceptorHandler){
        return errorInterceptorHandler.next(error);
      },
      onRequest: (request, requestInterceptorHandler) {
        print("${request.method} | ${request.path}");
        return requestInterceptorHandler.next(request);
      },
      onResponse: (response, responseInterceptorHandler) {
        print('${response.statusCode} ${response.data}');
        return responseInterceptorHandler.next(response);
      }
    ));
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;
    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future postRequest(String endPoint, Map<String, dynamic> data) async {
    Response response;
    try {
      response = await _dio.post(endPoint, data: data);
      print(response);
    } on DioError catch (e) {
      return e.response;
    }

    return response;
  }
}