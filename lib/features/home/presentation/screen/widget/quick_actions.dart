import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/assets_helper.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAction(
          icon: Icons.calendar_today_outlined,
          label: appTranslation().get('book_appointment_short'),
          onTap: () {},
        ),
        _buildAction(
          icon: Icons.videocam_outlined,
          label: appTranslation().get('online_consult'),
          onTap: () {},
        ),
        _buildAction(
          image: AssetsHelper.pharmacy,
          label: appTranslation().get('pharmacies'),
          onTap: () {},
        ),
        _buildAction(
          icon: Icons.folder_open_outlined,
          label: appTranslation().get('medical_file'),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildAction({
    IconData? icon,
    String? image,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ColorsManager.surfacePrimary,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ColorsManager.borderColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: image != null
                ? Image.asset(image, fit: BoxFit.contain)
                : Icon(icon, color: ColorsManager.primaryColor, size: 28),
          ),
          verticalSpace8,
          SizedBox(
            width: 80,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStylesManager.bold10.copyWith(color: ColorsManager.textPrimary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
