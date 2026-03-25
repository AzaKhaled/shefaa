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

class AuthRegisterLoadingState extends AuthState {}

class AuthRegisterSuccessState extends AuthState {}

class AuthRegisterErrorState extends AuthState {
  final String message;

  AuthRegisterErrorState({required this.message});
}

class AuthUpdateUIState extends AuthState {}
