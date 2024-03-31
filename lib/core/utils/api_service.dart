import 'package:dio/dio.dart';

class ApiService {
  final String _baseURL = "http://10.0.2.2:8000/api/"; //10.0.2.2
  final Dio dio;

  ApiService(this.dio);
  Future<dynamic> get({required String endPoint}) async {
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
