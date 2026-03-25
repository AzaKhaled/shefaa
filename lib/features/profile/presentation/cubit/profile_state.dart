import 'package:shefaa/features/profile/data/models/patient_profile_model.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final PatientProfileModel profileModel;
  ProfileSuccessState(this.profileModel);
}

class ProfileErrorState extends ProfileState {
  final String error;
  ProfileErrorState(this.error);
}
