import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/assets_helper.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/features/appointment/presentation/screen/widgets/badge_widget.dart';

class DoctorBasicInfoWidget extends StatelessWidget {
  final Map<String, dynamic> doctor;

  const DoctorBasicInfoWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManager.surfacePrimary,
            borderRadius: BorderRadius.circular(24),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              doctor['image'] ?? AssetsHelper.doctor,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        verticalSpace16,
        Text(
          doctor['name'] ?? '',
          style: TextStylesManager.bold24.copyWith(
            color: ColorsManager.textPrimary,
          ),
        ),
        verticalSpace8,
        Text(
          '${appTranslation().get('senior').isNotEmpty ? appTranslation().get('senior') : 'Senior'} ${doctor['specialty'] ?? ''}',
          style: TextStylesManager.regular14.copyWith(
            color: ColorsManager.textSecondary,
          ),
        ),
        verticalSpace16,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BadgeWidget(
              icon: Icons.medical_services_outlined,
              text:
                  doctor['specialty'] ??
                  (appTranslation().get('specialist').isNotEmpty
                      ? appTranslation().get('specialist')
                      : 'Specialist'),
            ),
            horizontalSpace8,
            BadgeWidget(
              icon: Icons.access_time,
              text:
                  '${doctor['exp'] ?? 0} ${appTranslation().get('years_exp').isNotEmpty ? appTranslation().get('years_exp') : 'yrs'}',
            ),
          ],
        ),
        verticalSpace16,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: ColorsManager.primaryAction.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star_border,
                color: ColorsManager.primaryAction,
                size: 16,
              ),
              horizontalSpace4,
              Text(
                '${doctor['rating'] ?? 0.0} ${appTranslation().get('rating').isNotEmpty ? appTranslation().get('rating') : 'Rating'}',
                style: TextStylesManager.bold12.copyWith(
                  color: ColorsManager.primaryAction,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
