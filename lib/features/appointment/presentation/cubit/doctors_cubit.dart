import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/network/remote/api_service.dart';
import 'package:shefaa/features/appointment/presentation/cubit/doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsStates> {
  DoctorsCubit() : super(DoctorsInitial());

  static DoctorsCubit get(context) => BlocProvider.of(context);

  Future<void> getDoctors() async {
    emit(DoctorsLoading());
    try {
      final doctorsResponse = await ApiService.getDoctors();
      emit(DoctorsSuccess(doctorsResponse.data));
    } catch (e) {
      emit(DoctorsError(e.toString()));
    }
  }
}
