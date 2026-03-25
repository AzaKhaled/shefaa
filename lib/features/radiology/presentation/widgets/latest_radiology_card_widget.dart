import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';

class LatestRadiologyCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String center;
  final VoidCallback? onViewImage;
  final VoidCallback? onDownload;

  const LatestRadiologyCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.center,
    this.onViewImage,
    this.onDownload,
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: ColorsManager.primaryColor,
                width: 4,
              ),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorsManager.secondaryColor.withValues(alpha: 0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.science_outlined,
                      color: ColorsManager.primaryColor,
                      size: 24,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: ColorsManager.secondaryColor.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      appTranslation().get('latest_result'),
                      style: TextStylesManager.bold10.copyWith(
                        color: ColorsManager.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: TextStylesManager.bold16.copyWith(
                  color: ColorsManager.textPrimaryLight,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStylesManager.regular12.copyWith(
                  color: ColorsManager.textSecondary,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildInfoBox(
                      appTranslation().get('date'),
                      date,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildInfoBox(
                      appTranslation().get('center'),
                      center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: onViewImage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      icon: const Icon(Icons.remove_red_eye_outlined, size: 18),
                      label: Text(
                        appTranslation().get('view_image'),
                        style: TextStylesManager.bold14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: onDownload,
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: ColorsManager.borderColor.withValues(alpha: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.file_download_outlined,
                        color: ColorsManager.textSecondary,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorsManager.backgroundColorLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStylesManager.bold10.copyWith(
              color: ColorsManager.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStylesManager.bold12.copyWith(
              color: ColorsManager.textPrimaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
