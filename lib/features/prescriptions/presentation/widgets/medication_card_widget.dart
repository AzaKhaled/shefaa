import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/primary/elvation_icon_button.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class MedicationCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String badgeText;
  final String frequencyValue;
  final String durationTitle;
  final String durationValue;
  final String? doctorName;
  final String? issueDate;

  const MedicationCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.badgeText,
    required this.frequencyValue,
    required this.durationTitle,
    required this.durationValue,
    this.doctorName,
    this.issueDate,
  });

  @override
  Widget build(BuildContext context) {
    String durationNumber = RegExp(r'\d+').stringMatch(durationValue) ?? "";
    String chipText = "$durationTitle ($durationNumber)";

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFE2EBE8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: ColorsManager.primaryColor, size: 20),
          ),
          horizontalSpace16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStylesManager.bold16.copyWith(
                    color: ColorsManager.textPrimary,
                  ),
                ),
                verticalSpace4,
                Text(
                  subtitle,
                  style: TextStylesManager.regular14.copyWith(
                    color: ColorsManager.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE2EBE8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  chipText,
                  style: TextStylesManager.bold10.copyWith(
                    color: ColorsManager.primaryColor,
                  ),
                ),
              ),
              verticalSpace8,
              Text(
                frequencyValue,
                style: TextStylesManager.regular12.copyWith(
                  color: ColorsManager.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
