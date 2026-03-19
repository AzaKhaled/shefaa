import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class BadgeWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const BadgeWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: ColorsManager.primaryAction.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorsManager.primaryAction.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: ColorsManager.primaryAction),
          horizontalSpace4,
          Text(
            text,
            style: TextStylesManager.bold12.copyWith(
              color: ColorsManager.primaryAction,
            ),
          ),
        ],
      ),
    );
  }
}
