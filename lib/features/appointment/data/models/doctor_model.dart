import '../../domain/entities/doctor.dart';

class DoctorResponse {
  final String status;
  final List<DoctorModel> data;

  DoctorResponse({required this.status, required this.data});

  factory DoctorResponse.fromJson(Map<String, dynamic> json) {
    return DoctorResponse(
      status: json['status'],
      data: (json['data'] as List).map((i) => DoctorModel.fromJson(i)).toList(),
    );
  }
}

class DoctorModel extends Doctor {
  DoctorModel({
    required super.id,
    required super.name,
    required super.specialty,
    required super.icon,
    required super.bio,
    required super.yearsOfExperience,
    required super.status,
    required super.tenantName,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      name: json['user']['name'],
      specialty: json['global_specialty']['name'],
      icon: json['global_specialty']['icon'],
      bio: json['bio'] ?? '',
      yearsOfExperience: json['years_of_experience'],
      status: json['status'],
      tenantName: json['tenant']['name'],
    );
  }
}
