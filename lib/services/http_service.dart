import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HttpService {
  String _baseUrl = 'https://service-handa.herokuapp.com/';
  late Dio _dio;

  HttpService() {
    var options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      contentType: 'application/x-www-form-urlencoded',
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
        print("${request.method} | ${request.path} | ${request.data}");
        return requestInterceptorHandler.next(request);
      },
      onResponse: (response, responseInterceptorHandler) {
        print('${response.statusCode} ${response.data}');
        return responseInterceptorHandler.next(response);
      }
    ));
  }

  Future<Response> getRequest(String endPoint) async {
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "token");
    _dio.options.headers = {HttpHeaders.authorizationHeader: "Bearer $token"};

    Response response;
    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      throw Exception(e);
    }

    return response;
  }

  Future postRequest(String endPoint, Map<String, dynamic> data) async {
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "token");
    _dio.options.headers = {HttpHeaders.authorizationHeader: "Bearer $token"};

    Response response;
    try {
      response = await _dio.post(
          endPoint,
          data: data,
      );
    } on DioError catch (e) {
      return e.response;
    }

    return response;
  }
}