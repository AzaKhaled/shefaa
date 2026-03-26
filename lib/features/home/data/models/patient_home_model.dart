class PatientHomeModel {
  final String message;
  final PatientHomeData data;

  PatientHomeModel({required this.message, required this.data});

  factory PatientHomeModel.fromJson(Map<String, dynamic> json) {
    return PatientHomeModel(
      message: json['message'],
      data: PatientHomeData.fromJson(json['data']),
    );
  }
}

class PatientHomeData {
  final PatientInfo patient;
  final Stats stats;
  final List<dynamic> upcomingAppointments;
  final List<Consultation> recentConsultations;
  final List<Prescription> activePrescriptions;

  PatientHomeData({
    required this.patient,
    required this.stats,
    required this.upcomingAppointments,
    required this.recentConsultations,
    required this.activePrescriptions,
  });

  factory PatientHomeData.fromJson(Map<String, dynamic> json) {
    return PatientHomeData(
      patient: PatientInfo.fromJson(json['patient']),
      stats: Stats.fromJson(json['stats']),
      upcomingAppointments: json['upcoming_appointments'] ?? [],
      recentConsultations: (json['recent_consultations'] as List)
          .map((i) => Consultation.fromJson(i))
          .toList(),
      activePrescriptions: (json['active_prescriptions'] as List)
          .map((i) => Prescription.fromJson(i))
          .toList(),
    );
  }
}

class PatientInfo {
  final int id;
  final String patientCode;
  final String name;
  final String status;

  PatientInfo({
    required this.id,
    required this.patientCode,
    required this.name,
    required this.status,
  });

  factory PatientInfo.fromJson(Map<String, dynamic> json) {
    return PatientInfo(
      id: json['id'],
      patientCode: json['patient_code'],
      name: json['name'],
      status: json['status'],
    );
  }
}

class Stats {
  final int appointmentsTotal;
  final int appointmentsUpcoming;
  final int consultationsTotal;
  final int prescriptionsActive;

  Stats({
    required this.appointmentsTotal,
    required this.appointmentsUpcoming,
    required this.consultationsTotal,
    required this.prescriptionsActive,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      appointmentsTotal: json['appointments_total'],
      appointmentsUpcoming: json['appointments_upcoming'],
      consultationsTotal: json['consultations_total'],
      prescriptionsActive: json['prescriptions_active'],
    );
  }
}

class Consultation {
  final int id;
  final String? startedAt;
  final String? endedAt;
  final String? chiefComplaint;
  final String? diagnosis;
  final String? status;
  final Doctor doctor;

  Consultation({
    required this.id,
    this.startedAt,
    this.endedAt,
    this.chiefComplaint,
    this.diagnosis,
    this.status,
    required this.doctor,
  });

  factory Consultation.fromJson(Map<String, dynamic> json) {
    return Consultation(
      id: json['id'],
      startedAt: json['started_at'],
      endedAt: json['ended_at'],
      chiefComplaint: json['chief_complaint'],
      diagnosis: json['diagnosis'],
      status: json['status'],
      doctor: Doctor.fromJson(json['doctor']),
    );
  }
}

class Prescription {
  final int id;
  final String prescriptionNumber;
  final String? diagnosis;
  final String status;
  final String issuedAt;
  final Doctor doctor;

  Prescription({
    required this.id,
    required this.prescriptionNumber,
    this.diagnosis,
    required this.status,
    required this.issuedAt,
    required this.doctor,
  });

  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
      id: json['id'],
      prescriptionNumber: json['prescription_number'],
      diagnosis: json['diagnosis'],
      status: json['status'],
      issuedAt: json['issued_at'],
      doctor: Doctor.fromJson(json['doctor']),
    );
  }
}

class Doctor {
  final int id;
  final int? yearsOfExperience;
  final String? bio;
  final DoctorUser user;

  Doctor({
    required this.id,
    this.yearsOfExperience,
    this.bio,
    required this.user,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      yearsOfExperience: json['years_of_experience'],
      bio: json['bio'],
      user: DoctorUser.fromJson(json['user']),
    );
  }
}

class DoctorUser {
  final int id;
  final String name;

  DoctorUser({required this.id, required this.name});

  factory DoctorUser.fromJson(Map<String, dynamic> json) {
    return DoctorUser(
      id: json['id'],
      name: json['name'],
    );
  }
}
