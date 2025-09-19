import 'package:dio/dio.dart';

class DioFile{
  final _dio = Dio(
    BaseOptions(
      sendTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    ),
  );


  Dio get dio => _dio;
}