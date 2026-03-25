import 'package:shefaa/core/network/remote/api_endpoints.dart';
import 'package:shefaa/core/utils/cubit/auth/auth_cubit.dart';
import 'package:shefaa/core/utils/cubit/theme/theme_cubit.dart';
import 'package:shefaa/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  
  sl.registerFactory(
    () => AuthCubit(),
  );
  sl.registerFactory(
    () => ThemeCubit(),
  );
  sl.registerFactory(
    () => ProfileCubit(),
  );

  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton(
    () => sharedPref,
  );

  sl.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    ),
  );
}
