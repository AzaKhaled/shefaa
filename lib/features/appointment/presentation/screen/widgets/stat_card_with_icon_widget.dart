import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class StatCardWithIconWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const StatCardWithIconWidget({
    super.key,
    required this.icon,
    required this.label,
  });

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
            Icon(icon, color: ColorsManager.primaryAction, size: 24),
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
