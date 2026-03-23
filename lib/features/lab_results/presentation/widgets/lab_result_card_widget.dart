import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/constants/primary/elvation_icon_button.dart';

class LabResultCardWidget extends StatelessWidget {
  final String title;
  final String date;
  final String labName;
  final String resultValue;
  final bool isNormal;

  const LabResultCardWidget({
    super.key,
    required this.title,
    required this.date,
    required this.labName,
    required this.resultValue,
    this.isNormal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Row 1: Title and Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStylesManager.bold16.copyWith(color: ColorsManager.textPrimary),
                ),
              ),
              if (isNormal)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle, color: ColorsManager.primaryColor, size: 16),
                      horizontalSpace4,
                      Text(
                        appTranslation().get('normal_result'),
                        style: TextStylesManager.bold12.copyWith(color: ColorsManager.primaryColor),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          verticalSpace16,
          
          // Row 2: Date and Lab Name
          Row(
            children: [
              Icon(Icons.calendar_today_outlined, size: 14, color: ColorsManager.textSecondary),
              horizontalSpace4,
              Text(
                date,
                style: TextStylesManager.regular12.copyWith(color: ColorsManager.textSecondary),
              ),
              horizontalSpace8,
              Icon(Icons.circle, size: 4, color: ColorsManager.textSecondary),
              horizontalSpace8,
              Icon(Icons.biotech, size: 16, color: ColorsManager.textSecondary),
              horizontalSpace4,
              Text(
                labName,
                style: TextStylesManager.regular12.copyWith(color: ColorsManager.textSecondary),
              ),
            ],
          ),
          verticalSpace24,

          // Row 3: Buttons
          Row(
            children: [
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: ElevationIconButton(
                    text: appTranslation().get('view_details'),
                    icon: Icons.remove_red_eye_outlined,
                    onPressed: () {},
                  ),
                ),
              ),
              horizontalSpace12,
              Container(
                decoration: BoxDecoration(
                  color: ColorsManager.primaryColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: IconButton(
                  icon: const Icon(Icons.file_download_outlined),
                  color: ColorsManager.primaryColor,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
