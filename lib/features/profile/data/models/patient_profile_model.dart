class PatientProfileModel {
  final String? message;
  final PatientProfileData? data;

  PatientProfileModel({this.message, this.data});

  factory PatientProfileModel.fromJson(Map<String, dynamic> json) {
    return PatientProfileModel(
      message: json['message'],
      data: json['data'] != null ? PatientProfileData.fromJson(json['data']) : null,
    );
  }
}

class PatientProfileData {
  final UserData? user;
  final PatientData? patient;
  final ProfileData? profile;

  PatientProfileData({this.user, this.patient, this.profile});

  factory PatientProfileData.fromJson(Map<String, dynamic> json) {
    return PatientProfileData(
      user: json['user'] != null ? UserData.fromJson(json['user']) : null,
      patient: json['patient'] != null ? PatientData.fromJson(json['patient']) : null,
      profile: json['profile'] != null ? ProfileData.fromJson(json['profile']) : null,
    );
  }
}

class UserData {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? phoneVerifiedAt;
  final String? status;

  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.phoneVerifiedAt,
    this.status,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      phoneVerifiedAt: json['phone_verified_at'],
      status: json['status'],
    );
  }
}

class PatientData {
  final int? id;
  final String? patientCode;
  final String? nationalId;
  final String? dateOfBirth;
  final String? gender;
  final String? bloodType;
  final String? emergencyContactName;
  final String? emergencyContactPhone;
  final String? status;

  PatientData({
    this.id,
    this.patientCode,
    this.nationalId,
    this.dateOfBirth,
    this.gender,
    this.bloodType,
    this.emergencyContactName,
    this.emergencyContactPhone,
    this.status,
  });

  factory PatientData.fromJson(Map<String, dynamic> json) {
    return PatientData(
      id: json['id'],
      patientCode: json['patient_code'],
      nationalId: json['national_id'],
      dateOfBirth: json['date_of_birth'],
      gender: json['gender'],
      bloodType: json['blood_type'],
      emergencyContactName: json['emergency_contact_name'],
      emergencyContactPhone: json['emergency_contact_phone'],
      status: json['status'],
    );
  }
}

class ProfileData {
  final int? id;
  final String? nationalId;
  final String? dateOfBirth;
  final String? gender;

  ProfileData({this.id, this.nationalId, this.dateOfBirth, this.gender});

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'],
      nationalId: json['national_id'],
      dateOfBirth: json['date_of_birth'],
      gender: json['gender'],
    );
  }
}
