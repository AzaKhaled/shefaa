import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

import 'package:shefaa/core/utils/constants/routes.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';

class MedicalFilesListWidget extends StatelessWidget {
  const MedicalFilesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                appTranslation().get('view_all'),
                style: TextStylesManager.bold12.copyWith(color: ColorsManager.primaryColor),
              ),
            ),
            Text(
              appTranslation().get('medical_records'),
              style: TextStylesManager.bold14.copyWith(color: ColorsManager.textSecondary),
            ),
          ],
        ),
        verticalSpace8,
        _buildFileItem(
          title: appTranslation().get('prescriptions'),
          subtitle: '3 ${appTranslation().get('active_medications')}',
          icon: Icons.receipt_long,
          iconColor: ColorsManager.primaryColor,
          onTap: () {
            context.push(Routes.medicalPrescriptions);
          },
        ),
        verticalSpace12,
        _buildFileItem(
          title: appTranslation().get('lab_results'),
          subtitle: '${appTranslation().get('last_update')}: Oct 12, 2023',
          icon: Icons.science,
          iconColor: ColorsManager.primaryColor,
          onTap: () {
            context.push(Routes.labResults);
          },
        ),
        verticalSpace12,
        _buildFileItem(
          title: appTranslation().get('radiology'),
          subtitle: 'X-Ray, MRI (2 ${appTranslation().get('files')})',
          icon: Icons.medical_services_outlined,
          iconColor: Colors.brown.shade400,
        ),
        verticalSpace12,
        _buildFileItem(
          title: appTranslation().get('surgeries'),
          subtitle: appTranslation().get('summary_last_visit'),
          icon: Icons.description,
          iconColor: Colors.blueGrey,
        ),
      ],
    );
  }

  Widget _buildFileItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorsManager.surfacePrimary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorsManager.borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: iconColor),
                ),
                horizontalSpace16,
                Text(
                  title,
                  style: TextStylesManager.bold14.copyWith(color: ColorsManager.textPrimary),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  subtitle,
                  style: TextStylesManager.regular12.copyWith(color: ColorsManager.textSecondary),
                ),
                horizontalSpace8,
                Icon(Icons.chevron_right, color: ColorsManager.primaryColor), // Use chevron_right standard for trailing (flips in RTL if autoMatchDirection is used, or we just rely on standard LTR trailing)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
