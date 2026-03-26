import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/network/remote/api_endpoints.dart';
import 'package:shefaa/core/network/remote/dio_helper.dart';
import 'package:shefaa/features/profile/data/models/patient_profile_model.dart';
import 'package:shefaa/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  // ignore: strict_top_level_inference
  static ProfileCubit get(context) => BlocProvider.of(context);

  PatientProfileModel? profileModel;

  Future<void> getPatientProfile() async {
    emit(ProfileLoadingState());
    
    debugPrint('🌐 Fetching Profile from: $patientProfileApi');
    final result = await DioHelper.getData(url: patientProfileApi);

    result.fold(
      (error) {
        debugPrint('❌ Profile Fetch Error: $error');
        emit(ProfileErrorState(error));
      },
      (response) {
        debugPrint('✅ Profile Data Received: ${response.data}');
        try {
          profileModel = PatientProfileModel.fromJson(response.data);
          emit(ProfileSuccessState(profileModel!));
        } catch (e) {
          debugPrint('❌ Parsing Error: $e');
          emit(ProfileErrorState('Parsing Error: $e'));
        }
      },
    );
  }

  Future<void> updatePatientProfile({
    required String name,
    required String phone,
    required String email,
    required String nationalId,
    required String dateOfBirth,
    required String gender,
    required String emergencyContactName,
    required String emergencyContactPhone,
  }) async {
    emit(UpdateProfileLoadingState());

    final result = await DioHelper.putData(
      url: patientProfileApi,
      data: {
        'name': name,
        'phone': phone,
        'email': email,
        'national_id': nationalId,
        'date_of_birth': dateOfBirth,
        'gender': gender,
        'emergency_contact_name': emergencyContactName,
        'emergency_contact_phone': emergencyContactPhone,
      },
    );

    result.fold(
      (error) {
        debugPrint('❌ Profile Update Error: $error');
        emit(UpdateProfileErrorState(error));
      },
      (response) {
        debugPrint('✅ Profile Updated Successfully: ${response.data}');
        try {
          profileModel = PatientProfileModel.fromJson(response.data);
          emit(UpdateProfileSuccessState(profileModel!));
        } catch (e) {
          debugPrint('❌ Parsing Error: $e');
          emit(UpdateProfileErrorState('Parsing Error: $e'));
        }
      },
    );
  }
}
  