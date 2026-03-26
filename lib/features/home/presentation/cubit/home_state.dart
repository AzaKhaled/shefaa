import 'package:shefaa/features/home/data/models/patient_home_model.dart';
import 'package:shefaa/features/home/data/models/specialty_model.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSuccess extends HomeStates {
  final PatientHomeModel homeData;
  final List<SpecialtyModel> specialties;

  HomeSuccess({required this.homeData, required this.specialties});
}

class HomeError extends HomeStates {
  final String error;

  HomeError(this.error);
}
