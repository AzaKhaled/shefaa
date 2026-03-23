import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/cubit/theme/theme_cubit.dart';
import 'package:shefaa/core/utils/cubit/theme/theme_state.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';
import 'package:shefaa/features/lab_results/presentation/widgets/lab_results_header_widget.dart';
import 'package:shefaa/features/lab_results/presentation/widgets/lab_results_list_widget.dart';

class LabResultsScreen extends StatelessWidget {
  const LabResultsScreen({super.key});

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
            leading: const SizedBox.shrink(),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios, // Back arrow matching RTL flip
                  color: ColorsManager.textPrimary,
                ),
                onPressed: () => context.pop,
              ),
              horizontalSpace8,
            ],
            title: Text(
              appTranslation().get('lab_results_title'),
              style: TextStylesManager.bold16.copyWith(
                color: ColorsManager.primaryColor.withValues(alpha: 0.8),
              ),
            ),
            centerTitle: false,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                verticalSpace16,
                const LabResultsHeaderWidget(),
                verticalSpace24,
                const LabResultsListWidget(),
                verticalSpace40,
              ],
            ),
          ),
        );
      },
    );
  }
}
