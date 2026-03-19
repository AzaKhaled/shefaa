import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/assets_helper.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/primary/primary_elevated_button.dart';
import 'package:shefaa/core/utils/constants/routes.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace80,
              Text(
                appTranslation().get('app_name'),
                style: TextStylesManager.bold40.copyWith(
                  color: ColorsManager.textPrimary,
                ),
              ),
              verticalSpace30,
              Expanded(
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      AssetsHelper.doctor2,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              verticalSpace24,
              Text(
                appTranslation().get('login_welcome_title'),
                style: TextStylesManager.bold26.copyWith(
                  color: ColorsManager.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpace8,
              Text(
                appTranslation().get('login_welcome_subtitle'),
                style: TextStylesManager.regular16.copyWith(
                  color: ColorsManager.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpace30,
              PrimaryElevatedButton(
                text: appTranslation().get('login'),
                textStyle: TextStylesManager.bold18.copyWith(
                  color: Colors.white,
                ),
                onPressed: () {
                  context.push(Routes.login);
                },
              ),
              verticalSpace16,
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: ColorsManager.primaryAction,
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    context.push(Routes.register);
                  },
                  child: Text(
                    appTranslation().get('create_account'),
                    style: TextStylesManager.bold18.copyWith(
                      color: ColorsManager.primaryAction,
                    ),
                  ),
                ),
              ),
              verticalSpace12,
              TextButton(
                onPressed: () {},
                child: Text(
                  '${appTranslation().get('continue_as_guest')} >',
                  style: TextStylesManager.regular16.copyWith(
                    color: ColorsManager.primaryAction,
                  ),
                ),
              ),
              verticalSpace20,
            ],
          ),
        ),
      ),
    );
  }
}
