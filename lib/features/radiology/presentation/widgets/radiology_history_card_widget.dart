import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';

class RadiologyHistoryCardWidget extends StatelessWidget {
  final String title;
  final String date;
  final String center;
  final IconData icon;
  final bool hasDicom;
  final VoidCallback? onDownload;
  final VoidCallback? onView;

  const RadiologyHistoryCardWidget({
    super.key,
    required this.title,
    required this.date,
    required this.center,
    required this.icon,
    this.hasDicom = false,
    this.onDownload,
    this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsManager.backgroundColorLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  color: ColorsManager.textSecondary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStylesManager.bold14.copyWith(
                        color: ColorsManager.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$date  •  $center',
                      style: TextStylesManager.regular12.copyWith(
                        color: ColorsManager.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: hasDicom ? 1 : 0,
                child: OutlinedButton(
                  onPressed: onDownload,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: ColorsManager.primaryColor,
                    side: BorderSide(color: ColorsManager.borderColor),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    appTranslation().get('download_report'),
                    style: TextStylesManager.bold12,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              if (hasDicom) ...[
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: onView,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ColorsManager.primaryColor,
                      side: BorderSide(color: ColorsManager.borderColor),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      appTranslation().get('view_dicom'),
                      style: TextStylesManager.bold12,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ] else if (onView != null) ...[
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: onView,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: ColorsManager.primaryColor,
                    side: BorderSide(color: ColorsManager.borderColor),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    appTranslation().get('view'),
                    style: TextStylesManager.bold12,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
