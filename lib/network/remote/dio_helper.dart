import 'package:dio/dio.dart';

// http://localhost:5000/recommend?title=Angels
class DioHelper {
  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:5000/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async
  {
    return await dio.get(
        url,
        queryParameters: query
    );
  }
}