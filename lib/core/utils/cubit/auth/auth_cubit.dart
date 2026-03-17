import 'dart:convert';

import 'package:shefaa/core/network/local/cache_helper.dart';
import 'package:shefaa/core/network/remote/api_endpoints.dart';
import 'package:shefaa/core/network/remote/dio_helper.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/cubit/auth/auth_state.dart';
import 'package:shefaa/core/models/user_model.dart';
import 'package:shefaa/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AuthCubit get authCubit => AuthCubit.get(navigatorKey.currentContext!);

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  final TextEditingController emailController = .new();
  final TextEditingController passwordController = .new();

  bool _isShowPassword = false;

  bool get isShowPassword => _isShowPassword;

  set isShowPassword(bool value) {
    _isShowPassword = value;
    emit(AuthShowPasswordState());
  }

  UserModel? userModel;

  Future<void> login() async {
    emit(AuthLoginLoadingState());
    final result = await DioHelper.postData(
      url: loginApi,
      data: {
        'email': emailController.text.trim(),
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
        _handleLoginSuccess(data!);
        debugPrint('✅ Login Success: $data');
        emit(AuthLoginSuccessState());
      },
    );
  }

  void _handleLoginSuccess(Map<String, dynamic> data) {
    token = data['token'] as String?;
    CacheHelper.saveData(key: 'auth_token', value: token);
    userModel = UserModel.fromJson(data['user'] as Map<String, dynamic>);
    CacheHelper.saveData(
      key: 'cached_user',
      value: jsonEncode(userModel!.toJson()),
    );
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
  }
}
