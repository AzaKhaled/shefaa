import 'dart:convert';

import 'package:shefaa/core/network/local/cache_helper.dart';
import 'package:shefaa/core/network/remote/api_endpoints.dart';
import 'package:shefaa/core/network/remote/dio_helper.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/cubit/auth/auth_state.dart';
import 'package:shefaa/core/models/user_model.dart';
import 'package:shefaa/core/models/register_request.dart';
import 'package:shefaa/core/network/remote/api_service.dart';
import 'package:shefaa/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AuthCubit get authCubit => AuthCubit.get(navigatorKey.currentContext!);

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  // Login Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Register Controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  bool isShowPassword = false;
  int selectedGender = 0; // 0 for male, 1 for female

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    emit(AuthShowPasswordState());
  }

  void changeGender(int value) {
    selectedGender = value;
    emit(AuthUpdateUIState());
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      dateController.text = "${picked.month}/${picked.day}/${picked.year}";
      emit(AuthUpdateUIState());
    }
  }

  UserModel? userModel;

  Future<void> login() async {
    emit(AuthLoginLoadingState());
    final result = await DioHelper.postData(
      url: loginApi,
      data: {
        'login': emailController.text.trim(),
        'password': passwordController.text.trim(),
      },
    );
    result.fold(
      (failure) {
        debugPrint('❌ Login Error: $failure');
        emit(AuthLoginErrorState(message: failure.toString()));
      },
      (response) {
        final data = response.data as Map<String, dynamic>?;
        if (data != null && data['success'] == true) {
          _handleLoginSuccess(data);
          debugPrint('✅ Login Success: $data');
          emit(AuthLoginSuccessState());
        } else {
          emit(AuthLoginErrorState(message: data?['message'] ?? 'Login failed'));
        }
      },
    );
  }

  Future<void> register() async {
    emit(AuthRegisterLoadingState());
    final request = RegisterRequest(
      name: fullNameController.text,
      phone: phoneController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordConfirmation: confirmPasswordController.text,
      nationalId: nationalIdController.text,
      dateOfBirth: dateController.text,
      gender: selectedGender == 0 ? 'male' : 'female',
    );

    try {
      final response = await ApiService.registerUser(request);
      if (response.success) {
        debugPrint('✅ Register Success');
        emit(AuthRegisterSuccessState());
      } else {
        emit(
          AuthRegisterErrorState(
            message: response.message ?? 'Registration failed',
          ),
        );
      }
    } catch (e) {
      emit(AuthRegisterErrorState(message: e.toString()));
    }
  }

  void _handleLoginSuccess(Map<String, dynamic> data) {
    token = data['token'] as String?;
    CacheHelper.saveData(key: 'auth_token', value: token);
    if (data['user'] != null) {
      userModel = UserModel.fromJson(data['user'] as Map<String, dynamic>);
      CacheHelper.saveData(
        key: 'cached_user',
        value: jsonEncode(userModel!.toJson()),
      );
    }
    _clearControllers();
  }

  void loadCachedUser() {
    final cached = CacheHelper.getData(key: 'cached_user');

    if (cached != null) {
      if (cached is String) {
        userModel = UserModel.fromJson(jsonDecode(cached));
      } else if (cached is Map<String, dynamic>) {
        userModel = UserModel.fromJson(cached);
      }

      emit(AuthUserLoadedFromCacheState());
    }
  }

  void _clearControllers() {
    emailController.clear();
    passwordController.clear();
    fullNameController.clear();
    phoneController.clear();
    nationalIdController.clear();
    confirmPasswordController.clear();
    dateController.clear();
  }
}
