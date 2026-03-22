import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class ProfileStatsWidget extends StatelessWidget {
  const ProfileStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _StatCardWidget(title: appTranslation().get('blood_type'), value: 'O+'),
        _StatCardWidget(title: appTranslation().get('height'), value: '182 ${appTranslation().get('cm')}'),
        _StatCardWidget(title: appTranslation().get('weight'), value: '78 ${appTranslation().get('kg')}'),
      ],
    );
  }
}

class _StatCardWidget extends StatelessWidget {
  final String title;
  final String value;

  const _StatCardWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: ColorsManager.surfacePrimary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorsManager.borderColor),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStylesManager.bold10.copyWith(
                color: ColorsManager.textSecondary,
                letterSpacing: 1.0,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace8,
            Text(
              value,
              style: TextStylesManager.bold16.copyWith(
                color: ColorsManager.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
