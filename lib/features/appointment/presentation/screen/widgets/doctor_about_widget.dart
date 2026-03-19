import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class DoctorAboutWidget extends StatelessWidget {
  final Map<String, dynamic> doctor;

  const DoctorAboutWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appTranslation().get('about').isNotEmpty
                ? appTranslation().get('about')
                : 'About',
            style: TextStylesManager.bold16.copyWith(
              color: ColorsManager.textPrimary,
            ),
          ),
          verticalSpace12,
          Text(
            appTranslation().get('about_doctor_desc').isNotEmpty
                ? appTranslation()
                      .get('about_doctor_desc')
                      .replaceAll('{name}', doctor['name'] ?? '')
                      .replaceAll('{exp}', '${doctor['exp'] ?? 0}')
                : '${doctor['name'] ?? ''} is a board-certified specialist with over ${doctor['exp'] ?? 0} years of experience in the medical field, specializing in preventive care and advanced diagnostic procedures for complex conditions.',
            style: TextStylesManager.regular14.copyWith(
              color: ColorsManager.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
