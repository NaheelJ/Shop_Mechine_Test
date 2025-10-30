import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'https://dummyjson.com/auth/login', // ✅ Use full URL (not relative)
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: {'username': username, 'password': password, 'expiresInMins': 30},
      );

      // ✅ Handle success
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Login failed: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      // ✅ Better error handling
      if (e.response != null) {
        final message =
            e.response?.data['message'] ?? e.response?.statusMessage;
        throw Exception('Login failed: $message');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<Map<String, dynamic>> getMe(String token) async {
    try {
      final response = await _dio.get(
        '/auth/me',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to get user details: ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> getProducts(int skip, int limit) async {
    try {
      final response = await _dio.get(
        '/products',
        queryParameters: {'skip': skip, 'limit': limit},
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to load products: ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> getProductById(int id) async {
    try {
      final response = await _dio.get('/products/$id');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load product details: ${e.toString()}');
    }
  }
}
