import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/primary/primary_elevated_button.dart';
import 'package:shefaa/core/utils/constants/routes.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/cubit/theme/theme_cubit.dart';
import 'package:shefaa/core/utils/cubit/theme/theme_state.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final defaultPinTheme = PinTheme(
          width: 56,
          height: 60,
          textStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: ColorsManager.textPrimary,
          ),
          decoration: BoxDecoration(
            color: ColorsManager.surfacePrimary,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ColorsManager.borderColor),
          ),
        );

        return Scaffold(
          backgroundColor: ColorsManager.background,
          appBar: AppBar(
            backgroundColor: ColorsManager.background,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: Icon(
              Icons.arrow_back_ios,
              color: ColorsManager.textPrimary,
            ),
            title: Text(
              appTranslation().get('careplus'),
              style: TextStylesManager.bold16.copyWith(
                color: ColorsManager.primaryColor,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: ColorsManager.surfacePrimary,
                  child: const Icon(
                    Icons.phonelink_ring_outlined,
                    size: 50,
                    color: ColorsManager.primaryColor,
                  ),
                ),
                verticalSpace20,
                Text(
                  appTranslation().get('otp_verification'),
                  style: TextStylesManager.bold24.copyWith(
                    color: ColorsManager.textPrimary,
                  ),
                ),
                verticalSpace10,
                Text(
                  appTranslation().get('otp_desc'),
                  textAlign: TextAlign.center,
                  style: TextStylesManager.regular16.copyWith(
                    color: ColorsManager.textPrimary,
                  ),
                ),
                verticalSpace5,
                Text(
                  "+1 ••• ••• 4920",
                  style: TextStylesManager.regular16.copyWith(
                    color: ColorsManager.textPrimary,
                  ),
                ),
                verticalSpace30,
                Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyDecorationWith(
                    border: Border.all(
                      color: ColorsManager.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
                verticalSpace30,
                PrimaryElevatedButton(
                  text: appTranslation().get('verify_code'),
                  onPressed: () {
                    context.push(Routes.root);
                  },
                ),
                verticalSpace20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      appTranslation().get('didnt_receive'),
                      style: TextStyle(color: ColorsManager.textSecondary),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        appTranslation().get('resend_code'),
                        style: TextStylesManager.bold16.copyWith(
                          color: ColorsManager.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
