import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class ProfileSummaryWidget extends StatelessWidget {
  const ProfileSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorsManager.primaryColor, width: 2),
              ),
              child: const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/images/person.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(2),
                child: const Icon(
                  Icons.verified,
                  color: ColorsManager.primaryColor,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        horizontalSpace16,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ميار محمد",
                style: TextStylesManager.bold20.copyWith(color: ColorsManager.textPrimary),
              ),
              verticalSpace4,
              Text(
                "28 years  •  DOB: 14/05/1995",
                style: TextStylesManager.regular12.copyWith(color: ColorsManager.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
