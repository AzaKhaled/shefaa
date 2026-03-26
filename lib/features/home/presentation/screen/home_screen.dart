import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/features/home/presentation/cubit/home_cubit.dart';
import 'package:shefaa/features/home/presentation/cubit/home_state.dart';
import 'package:shefaa/features/home/presentation/screen/widget/active_prescriptions.dart';
import 'package:shefaa/features/home/presentation/screen/widget/home_header.dart';
import 'package:shefaa/features/home/presentation/screen/widget/home_search.dart';
import 'package:shefaa/features/home/presentation/screen/widget/next_appointment_card.dart';
import 'package:shefaa/features/home/presentation/screen/widget/patient_stats.dart';
import 'package:shefaa/features/home/presentation/screen/widget/quick_actions.dart';
import 'package:shefaa/features/home/presentation/screen/widget/recent_consultations.dart';
import 'package:shefaa/features/home/presentation/screen/widget/specialties_list.dart';
import 'package:shefaa/features/home/presentation/screen/widget/promo_banner.dart';
import 'package:shefaa/features/home/presentation/screen/widget/top_doctors_list.dart';
import 'package:shefaa/features/home/presentation/screen/widget/nearby_pharmacies_list.dart';

import '../../../../core/theme/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        backgroundColor: ColorsManager.background,
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return _buildLoadingState();
              } else if (state is HomeSuccess) {
                final data = state.homeData.data;
                return RefreshIndicator(
                  onRefresh: () => context.read<HomeCubit>().getHomeData(),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeHeader(name: data.patient.name),
                        verticalSpace24,
                        PatientStats(stats: data.stats),
                        verticalSpace24,
                        const HomeSearch(),
                        verticalSpace24,
                        NextAppointmentCard(appointments: data.upcomingAppointments),
                        verticalSpace24,
                        ActivePrescriptions(prescriptions: data.activePrescriptions),
                        verticalSpace24,
                        const QuickActions(),
                        verticalSpace32,
                        SpecialtiesList(specialties: state.specialties),
                        verticalSpace24,
                        TopDoctorsList(consultations: data.recentConsultations),
                        verticalSpace24,
                        const PromoBanner(),
                        verticalSpace32,
                        const NearbyPharmaciesList(),
                        verticalSpace40,
                      ],
                    ),
                  ),
                );
              } else if (state is HomeError) {
                // Return Success design with dummy data or a more graceful error if it's just a parsing issue
                return _buildErrorState(context, state.error);
              }
              return _buildLoadingState();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(ColorsManager.primaryColor),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 60, color: Colors.red),
            verticalSpace16,
            Text(
              'Oops! Something went wrong',
              style: TextStylesManager.bold18,
            ),
            verticalSpace8,
            Text(
              error,
              textAlign: TextAlign.center,
              style: TextStylesManager.regular14.copyWith(color: ColorsManager.textSecondary),
            ),
            verticalSpace24,
            ElevatedButton(
              onPressed: () => context.read<HomeCubit>().getHomeData(),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Try Again', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
