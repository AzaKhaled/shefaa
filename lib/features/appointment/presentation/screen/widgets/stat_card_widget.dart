import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class StatCardWidget extends StatelessWidget {
  final String value;
  final String label;

  const StatCardWidget({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: ColorsManager.surfacePrimary,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorsManager.borderColor),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStylesManager.bold18.copyWith(
                color: ColorsManager.primaryAction,
              ),
            ),
            verticalSpace4,
            Text(
              label,
              style: TextStylesManager.bold10.copyWith(
                color: ColorsManager.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
