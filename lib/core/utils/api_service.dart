import 'package:dio/dio.dart';

class ApiService {
  final String _baseURL = "http://127.0.0.1:8000/api/";
  final Dio dio;

  ApiService(this.dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get(
      "$_baseURL$endPoint",
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> body}) async {
    var response = await dio.post(
      "$_baseURL$endPoint",
      queryParameters: body,
    );
    return response.data;
  }
}
