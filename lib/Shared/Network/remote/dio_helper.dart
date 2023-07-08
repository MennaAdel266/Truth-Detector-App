import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper
{
  static Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.1.7:5000',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type':'application/json',
        },
      ),
    );
  }

  static Future<Response> postData(
      {
        @required String url,
        Map<String, dynamic> query,
        @required Map<String, dynamic> data,
        String lang = 'en',
        String token ,
      }) async
  {
    dio.options.headers =
    {
      'lang':lang,
      'Content-Type' : 'application/json',
      'Authorization': token??'',
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData(
      {
        @required String url,
        Map<String, dynamic> query,
        @required Map<String, dynamic> data,
        String lang = 'en',
        String token ,
      }) async
  {
    dio.options.headers =
    {
      'lang':lang,
      'Authorization': token??'',
      'Content-Type' : 'application/json',
    };
    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> getData({
    @required String url,
    Map<String, dynamic> query,
    String lang = 'en',
    String token,
  }) async
  {
    dio.options.headers =
    {
      'lang': lang,
      'Authorization': token??'',
      'Content-Type':'application/json',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}