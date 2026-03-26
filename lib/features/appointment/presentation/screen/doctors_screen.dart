import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/features/appointment/presentation/cubit/doctors_cubit.dart';
import 'package:shefaa/features/appointment/presentation/cubit/doctors_state.dart';

import 'widgets/booking_progress_widget.dart';
import 'widgets/doctor_card_widget.dart';
import 'widgets/filter_chips_widget.dart';
import 'widgets/search_bar_widget.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorsCubit()..getDoctors(),
      child: Scaffold(
        backgroundColor: ColorsManager.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Text(
            appTranslation().get('choose_doctor'),
            style: TextStylesManager.bold18.copyWith(
              color: ColorsManager.textPrimary,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              verticalSpace10,
              BookingProgressWidget(
                title: appTranslation().get('booking_progress'),
                step: appTranslation().get('step_2_of_4'),
                progress: 0.5,
              ),
              verticalSpace20,
              SearchBarWidget(controller: _searchController),
              verticalSpace20,
              FilterChipsWidget(),
              verticalSpace20,
              Expanded(
                child: BlocBuilder<DoctorsCubit, DoctorsStates>(
                  builder: (context, state) {
                    if (state is DoctorsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is DoctorsSuccess) {
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.doctors.length,
                        separatorBuilder: (context, index) => verticalSpace16,
                        itemBuilder: (context, index) {
                          final doctor = state.doctors[index];
                          return DoctorCardWidget(doctor: doctor);
                        },
                      );
                    } else if (state is DoctorsError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: TextStylesManager.regular14.copyWith(
                            color: Colors.red,
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
