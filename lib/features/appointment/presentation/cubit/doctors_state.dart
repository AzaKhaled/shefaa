import 'package:shefaa/features/appointment/domain/entities/doctor.dart';

abstract class DoctorsStates {}

class DoctorsInitial extends DoctorsStates {}

class DoctorsLoading extends DoctorsStates {}

class DoctorsSuccess extends DoctorsStates {
  final List<Doctor> doctors;

  DoctorsSuccess(this.doctors);
}

class DoctorsError extends DoctorsStates {
  final String message;

  DoctorsError(this.message);
}
