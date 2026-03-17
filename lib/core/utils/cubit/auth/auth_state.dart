abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthShowPasswordState extends AuthState {}

class AuthLoginLoadingState extends AuthState {}

class AuthLoginSuccessState extends AuthState {}

class AuthLoginErrorState extends AuthState {
  final String message;

  AuthLoginErrorState({required this.message});
}

class AuthUserLoadedFromCacheState extends AuthState {}
