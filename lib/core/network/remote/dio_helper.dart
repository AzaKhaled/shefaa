import 'package:shefaa/core/di/injections.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shefaa/core/utils/constants/constants.dart';

class DioHelper {
  static Dio getDio() => sl<Dio>();

  static Future<Either<String, Response>> getData({
    required String url,
    Map<String, dynamic>? query,
    String? search,
  }) async {
    try {
      debugPrint('🚀 GET Request: $url');
      debugPrint('🔑 Sending Token: $token');
      
      final Response response = await getDio().get(
        url,
        queryParameters: {
          if (search != null) 'q': search,
          ...?query,
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            if (token != null && token!.isNotEmpty)
              'Authorization': 'Bearer $token',
          },
        ),
      );
      return Right(response);
    } on DioException catch (error) {
      if (error.response?.statusCode == 401) {
        return const Left('Unauthenticated');
      }
      final msg = _parseError(error);
      return Left(msg);
    } catch (e) {
      return const Left('something went wrong');
    }
  }

  static Future<Either<String, Response>> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      debugPrint('🚀 POST Request: $url');
      final Response response = await getDio().post(
        url,
        data: data,
        queryParameters: query,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            if (token != null && token!.isNotEmpty)
              'Authorization': 'Bearer $token',
          },
        ),
      );
      return Right(response);
    } on DioException catch (error) {
      final msg = _parseError(error);
      return Left(msg);
    } catch (e) {
      return const Left('something went wrong');
    }
  }

  static Future<Either<String, Response>> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      debugPrint('🚀 PUT Request: $url');
      final Response response = await getDio().put(
        url,
        data: data,
        queryParameters: query,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            if (token != null && token!.isNotEmpty)
              'Authorization': 'Bearer $token',
          },
        ),
      );
      return Right(response);
    } on DioException catch (error) {
      final msg = _parseError(error);
      return Left(msg);
    } catch (e) {
      return const Left('something went wrong');
    }
  }

  static String _parseError(DioException error) {
    final response = error.response;
    if (response == null) return 'No response from server';
    if (response.data is Map) {
      final map = response.data as Map;
      return map['message']?.toString() ?? map['errors']?.toString() ?? 'Error ${response.statusCode}';
    }
    return 'Error: ${response.statusCode}';
  }
}
