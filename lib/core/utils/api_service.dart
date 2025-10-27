import 'package:dio/dio.dart';
import 'pref_helper.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://127.0.0.1:8000/api',
        headers: {"Content-Type": "application/json"},
      ),
    );

    // إضافة التوكن تلقائيًا قبل كل طلب
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

  // دالة GET
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await _dio.get(endPoint);
    return response.data;
  }

  // دالة POST
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.post(endPoint, data: data);
    return response.data;
  }

  // دالة PUT
  Future<Map<String, dynamic>> put({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.put(endPoint, data: data);
    return response.data;
  }

  // دالة DELETE
  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    final response = await _dio.delete(endPoint);
    return response.data;
  }
}
