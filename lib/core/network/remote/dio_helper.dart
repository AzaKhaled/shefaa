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
      final Response response = await getDio().get(
        url,
        queryParameters: {'q': ?search, ...?query},
        options: Options(
          headers: {
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
      debugPrint('DioHelper.get error: $e');
      return const Left('something went wrong, please try again later');
    }
  }

  static Future<Either<String, Response>> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final Response response = await getDio().post(
        url,
        data: data,
        queryParameters: query,
        options: Options(
          headers: {
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
      debugPrint('DioHelper.post error: $e');
      return const Left('something went wrong, please try again later');
    }
  }

  static String _parseError(DioException error) {
    final response = error.response;
    if (response == null) return 'No response from server';

    if (response.data is Map) {
      final map = response.data as Map;
      if (map['errors'] is List && map['errors'].isNotEmpty) {
        return map['errors'].first.toString();
      }
      if (map['message'] != null) {
        return map['message'].toString();
      }
    }
    return 'Error: ${response.statusCode ?? 'unknown'}';
  }
}
