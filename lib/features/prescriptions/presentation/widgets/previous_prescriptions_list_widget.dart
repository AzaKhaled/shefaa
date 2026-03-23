import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class PreviousPrescriptionsListWidget extends StatelessWidget {
  const PreviousPrescriptionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appTranslation().get('previous_prescriptions'),
          style: TextStylesManager.bold16.copyWith(color: ColorsManager.textPrimary),
        ),
        verticalSpace16,
        _buildPreviousItem("إيبوبروفين 400 مجم", "د. سارة جينكينز • يوليو 2023"),
        verticalSpace12,
        _buildPreviousItem("سيتيريزين 10 مجم", "د. آلان سميث • مارس 2023"),
      ],
    );
  }

  Widget _buildPreviousItem(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStylesManager.bold14.copyWith(color: ColorsManager.textPrimary),
                ),
                verticalSpace4,
                Text(
                  subtitle,
                  style: TextStylesManager.regular12.copyWith(color: ColorsManager.textSecondary),
                ),
              ],
            ),
          ),
          horizontalSpace12,
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.history,
              color: Colors.black54,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
