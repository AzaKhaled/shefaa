class RegisterResponse {
  final bool success;
  final String? message;

  RegisterResponse({required this.success, this.message});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      success: json['success'] ?? false,
      message: json['message'] as String?,
    );
  }
}
