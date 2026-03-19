import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';
import 'package:shefaa/features/appointment/presentation/screen/widgets/doctor_basic_info_widget.dart';
import 'package:shefaa/features/appointment/presentation/screen/widgets/doctor_about_widget.dart';
import 'package:shefaa/features/appointment/presentation/screen/widgets/doctor_stats_widget.dart';
import 'package:shefaa/features/appointment/presentation/screen/widgets/doctor_location_widget.dart';
import 'package:shefaa/features/appointment/presentation/screen/widgets/doctor_bottom_navigation_bar_widget.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Expected to receive doctor details map
    final doctor = context.getArg<Map<String, dynamic>>();

    if (doctor == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: ColorsManager.textPrimary),
            onPressed: () => context.pop,
          ),
          elevation: 0,
          backgroundColor: ColorsManager.background,
        ),
        body: const Center(child: Text('Doctor data not found')),
      );
    }

    return Scaffold(
      backgroundColor: ColorsManager.background,
      appBar: AppBar(
        backgroundColor: ColorsManager.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorsManager.textPrimary),
          onPressed: () => context.pop,
        ),
        title: Text(
          doctor['name'] ?? '',
          style: TextStylesManager.bold16.copyWith(
            color: ColorsManager.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DoctorBasicInfoWidget(doctor: doctor),
            verticalSpace24,
            DoctorAboutWidget(doctor: doctor),
            verticalSpace24,
            const DoctorStatsWidget(),
            verticalSpace24,
            DoctorLocationWidget(doctor: doctor),
            verticalSpace40,
          ],
        ),
      ),
      bottomNavigationBar: DoctorBottomNavigationBarWidget(doctor: doctor),
    );
  }
}
