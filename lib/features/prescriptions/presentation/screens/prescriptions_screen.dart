import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/cubit/theme/theme_cubit.dart';
import 'package:shefaa/core/utils/cubit/theme/theme_state.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';
import 'package:shefaa/features/prescriptions/presentation/widgets/prescriptions_header_widget.dart';
import 'package:shefaa/features/prescriptions/presentation/widgets/active_medications_list_widget.dart';
import 'package:shefaa/features/prescriptions/presentation/widgets/previous_prescriptions_list_widget.dart';

class PrescriptionsScreen extends StatelessWidget {
  const PrescriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsManager.background,
          appBar: AppBar(
            backgroundColor: ColorsManager.background,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: ColorsManager.primaryColor,
              ),
              onPressed: () => context.pop,
            ),
            title: const SizedBox.shrink(),
            actions: [
              Center(
                child: Text(
                  appTranslation().get('medical_prescriptions_title'),
                  style: TextStylesManager.bold16.copyWith(
                    color: ColorsManager.primaryColor,
                  ),
                ),
              ),
              horizontalSpace16,
            ],
            centerTitle: false, 
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                verticalSpace16,
                const PrescriptionsHeaderWidget(),
                verticalSpace24,
                const ActiveMedicationsListWidget(),
                verticalSpace32,
                const PreviousPrescriptionsListWidget(),
                verticalSpace40,
              ],
            ),
          ),
        );
      },
    );
  }
}
