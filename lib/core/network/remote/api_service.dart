import 'package:dio/dio.dart';
import 'package:shefaa/core/network/remote/api_endpoints.dart';
import 'package:shefaa/core/models/register_request.dart';
import 'package:shefaa/core/models/register_response.dart';
import 'package:shefaa/core/models/login_request.dart';
import 'package:shefaa/core/models/login_response.dart';

class ApiService {
  static final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl, connectTimeout: const Duration(seconds: 10)));

  static Future<RegisterResponse> registerUser(RegisterRequest request) async {
    try {
      final response = await _dio.post(registerApi, data: request.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterResponse.fromJson(response.data);
      } else {
        return RegisterResponse(success: false, message: response.data['message'] ?? 'Registration failed');
      }
    } catch (e) {
      return RegisterResponse(success: false, message: e.toString());
    }
  }

  static Future<LoginResponse> loginUser(LoginRequest request) async {
    try {
      final response = await _dio.post(loginApi, data: request.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginResponse.fromJson(response.data);
      } else {
        return LoginResponse(success: false, message: response.data['message'] ?? 'Login failed');
      }
    } catch (e) {
      return LoginResponse(success: false, message: e.toString());
    }
  }
}
