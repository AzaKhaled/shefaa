import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/constants/assets_helper.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorsManager.primaryAction.withValues(alpha: 0.3),
                  width: 3,
                ),
              ),
              child: const CircleAvatar(
                radius: 46,
                backgroundImage: AssetImage(AssetsHelper.person),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: ColorsManager.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, color: Colors.white, size: 16),
              ),
            ),
          ],
        ),
        verticalSpace16,
        Text(
          'Ahmed',
          style: TextStylesManager.bold22.copyWith(
            color: ColorsManager.textPrimary,
          ),
        ),
        verticalSpace4,
        Text(
          'ahmed@example.com',
          style: TextStylesManager.regular14.copyWith(
            color: ColorsManager.textSecondary,
          ),
        ),
      ],
    );
  }
}
