import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/assets_helper.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class HomeHeader extends StatelessWidget {
  final String name;
  const HomeHeader({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(AssetsHelper.person),
        ),
        horizontalSpace12,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appTranslation().get('welcome_back'),
              style: TextStylesManager.regular12.copyWith(color: ColorsManager.textSecondary),
            ),
            Text(
              '${appTranslation().get('hello')}, $name',
              style: TextStylesManager.bold18.copyWith(color: ColorsManager.primaryColor),
            ),
          ],
        ),
        const Spacer(),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorsManager.borderColor),
              ),
              child: Icon(
                Icons.notifications_none_outlined,
                color: ColorsManager.primaryColor,
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
