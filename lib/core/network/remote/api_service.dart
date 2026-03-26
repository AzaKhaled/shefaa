import 'package:dio/dio.dart';
import 'package:shefaa/core/network/remote/api_endpoints.dart';
import 'package:shefaa/core/models/register_request.dart';
import 'package:shefaa/core/models/register_response.dart';
import 'package:shefaa/core/models/login_request.dart';
import 'package:shefaa/core/models/login_response.dart';
import 'package:shefaa/features/home/data/models/patient_home_model.dart';
import 'package:shefaa/features/home/data/models/specialty_model.dart';

import 'package:shefaa/features/appointment/data/models/doctor_model.dart';

class ApiService {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
  ));

  static void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

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

  static Future<PatientHomeModel> getPatientHomeData() async {
    try {
      final response = await _dio.get(patientHomeApi);
      return PatientHomeModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load home data: ${e.toString()}');
    }
  }

  static Future<SpecialtiesResponse> getSpecialties() async {
    try {
      final response = await _dio.get(specialtiesApi);
      return SpecialtiesResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load specialties: ${e.toString()}');
    }
  }

  static Future<DoctorResponse> getDoctors() async {
    try {
      final response = await _dio.get(doctorsApi);
      return DoctorResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load doctors: ${e.toString()}');
    }
  }
}
