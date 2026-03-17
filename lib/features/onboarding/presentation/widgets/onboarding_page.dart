import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/features/onboarding/data/models/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingPage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        // Image
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorsManager.surfacePrimary,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                model.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Spacer(flex: 1),
        // Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            model.title,
            textAlign: TextAlign.center,
            style: TextStylesManager.bold24.copyWith(
              color: ColorsManager.textPrimary,
            ),
          ),
        ),
        verticalSpace16,
        // Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            model.description,
            textAlign: TextAlign.center,
            style: TextStylesManager.regular16.copyWith(
              color: ColorsManager.textSecondary,
              height: 1.5,
            ),
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
