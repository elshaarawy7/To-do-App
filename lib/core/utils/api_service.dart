import 'package:dio/dio.dart';
import 'pref_helper.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:8000/api', // ← عدل الـ IP حسب جهازك
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {"Content-Type": "application/json"},
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await PrefHelper.getToken();

          if (token != null && token.isNotEmpty && token != 'guest') {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
      ),
    );
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await _dio.get(endPoint);
    return Map<String, dynamic>.from(response.data);
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.post(endPoint, data: data);
    return Map<String, dynamic>.from(response.data);
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.put(endPoint, data: data);
    return Map<String, dynamic>.from(response.data);
  }
}
