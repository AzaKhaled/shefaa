import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/routes.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';
import 'dart:async';

import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/network/local/cache_helper.dart';

import '../../../../core/theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      final bool onboardingCompleted =
          CacheHelper.getData(key: 'onboardingCompleted') ?? false;
      context.push(onboardingCompleted ? Routes.login : Routes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryAction,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(
                Icons.shield,
                color: Color(0xFF7BA2CC),
              ),
            ),


            verticalSpace20,
            Text(
                appTranslation().get('app_name'),
              style: TextStylesManager.bold10
            ),


            Text(
              appTranslation().get('splash_slogan'),
              style:TextStylesManager.regular18.copyWith(
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),

            const Spacer(flex: 2),


            Text(
              appTranslation().get('splash_loading'),
              style:TextStylesManager.regular14.copyWith(
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),

            const SizedBox(height: 15),

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const LinearProgressIndicator(
                backgroundColor: Colors.white24,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                minHeight: 4,
              ),
            ),

            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
