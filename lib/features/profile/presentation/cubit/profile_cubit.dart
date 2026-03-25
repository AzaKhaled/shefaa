import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/network/remote/api_endpoints.dart';
import 'package:shefaa/core/network/remote/dio_helper.dart';
import 'package:shefaa/features/profile/data/models/patient_profile_model.dart';
import 'package:shefaa/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  PatientProfileModel? profileModel;

  Future<void> getPatientProfile() async {
    emit(ProfileLoadingState());
    final result = await DioHelper.getData(url: patientProfileApi);

    result.fold(
      (error) {
        emit(ProfileErrorState(error));
      },
      (response) {
        profileModel = PatientProfileModel.fromJson(response.data);
        emit(ProfileSuccessState(profileModel!));
      },
    );
  }
}
