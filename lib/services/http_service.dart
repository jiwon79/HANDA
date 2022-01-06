import 'package:dio/dio.dart';

class HttpService {
  String _baseUrl = 'https://service-handa.herokuapp.com/';
  late Dio _dio;

  HttpService() {
    // _dio = Dio();
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl
    ));

    initializeInterceptors();
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, errorInterceptorHandler){
        print(error.message);
        return errorInterceptorHandler.next(error);
      },
      onRequest: (request, requestInterceptorHandler) {
        print("${request.method} | ${request.path}");
        return requestInterceptorHandler.next(request);
      },
      onResponse: (response, responseInterceptorHandler) {
        print('${response.statusCode} ${response.statusCode} ${response.data}');
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
}