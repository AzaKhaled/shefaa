import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/constants/primary/primary_text_field.dart';

class LabResultsHeaderWidget extends StatelessWidget {
  const LabResultsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appTranslation().get('specialized_department'),
          style: TextStylesManager.bold12.copyWith(color: ColorsManager.primaryColor),
        ),
        verticalSpace8,
        Text(
          appTranslation().get('heart_tests'),
          style: TextStylesManager.bold26.copyWith(color: ColorsManager.textPrimary),
        ),
        verticalSpace8,
        Text(
          appTranslation().get('heart_tests_desc'),
          style: TextStylesManager.regular14.copyWith(color: ColorsManager.textSecondary),
        ),
        verticalSpace24,
        Row(
          children: [
            Expanded(
              child: PrimaryTextField(
                controller: TextEditingController(),
                hint: appTranslation().get('search_lab_test'),
              ),
            ),
            horizontalSpace12,
            Container(
              height: 50, // Usually match standard text field height
              width: 50,
              decoration: BoxDecoration(
                color: ColorsManager.borderColor.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: const Icon(Icons.filter_list),
                color: ColorsManager.primaryColor,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
