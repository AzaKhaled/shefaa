import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/cubit/theme/theme_cubit.dart';
import 'package:shefaa/core/utils/cubit/theme/theme_state.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';
import 'package:shefaa/features/medical_history/presentation/widgets/patient_info_drawer.dart';
import 'package:shefaa/features/medical_history/presentation/widgets/profile_summary_widget.dart';
import 'package:shefaa/features/medical_history/presentation/widgets/vitals_grid_widget.dart';
import 'package:shefaa/features/medical_history/presentation/widgets/specialties_list_widget.dart';
import 'package:shefaa/features/medical_history/presentation/widgets/medical_files_list_widget.dart';

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsManager.background,
          endDrawer: const PatientInfoDrawer(),
          appBar: AppBar(
            backgroundColor: ColorsManager.background,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: ColorsManager.textPrimary,
              ),
              onPressed: () => context.pop,
            ),
            title: Text(
              appTranslation().get('medical_history'),

              style: TextStylesManager.bold16.copyWith(
                color: ColorsManager.textPrimary,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace24,
                const ProfileSummaryWidget(),
                verticalSpace24,
                const VitalsGridWidget(),
                verticalSpace24,
                const SpecialtiesListWidget(),
                verticalSpace24,
                const MedicalFilesListWidget(),
                verticalSpace40,
              ],
            ),
          ),
        );
      },
    );
  }
}
