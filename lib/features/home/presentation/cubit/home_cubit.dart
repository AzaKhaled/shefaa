import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/network/remote/api_service.dart';
import 'package:shefaa/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getHomeData() async {
    emit(HomeLoading());
    try {
      final homeData = await ApiService.getPatientHomeData();
      final specialties = await ApiService.getSpecialties();
      emit(HomeSuccess(homeData: homeData, specialties: specialties.data));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
