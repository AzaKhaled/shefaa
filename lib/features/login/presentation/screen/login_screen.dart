import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/primary/conditional_builder.dart';
import 'package:shefaa/core/utils/constants/primary/primary_elevated_button.dart';
import 'package:shefaa/core/utils/constants/primary/primary_text_field.dart';
import 'package:shefaa/core/utils/constants/routes.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';
import 'package:shefaa/core/utils/cubit/auth/auth_cubit.dart';
import 'package:shefaa/core/utils/cubit/auth/auth_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final cubit = AuthCubit.get(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSuccessState) {
          context.pushNamedAndRemoveUntil(Routes.home, (route) => false);
        } else if (state is AuthLoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorsManager.primaryColor,
                  ColorsManager.primaryColor.withValues(alpha: 0.8),
                ],
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      verticalSpace60,
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          appTranslation().get('welcome_back'),
                          style: TextStylesManager.regular12.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      verticalSpace8,
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          appTranslation().get('app_name'),
                          style: TextStylesManager.bold20.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      verticalSpace10,
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  width: 1.5,
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 60, 20, 20),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          color: ColorsManager.primaryColor
                                              .withValues(alpha: 0.5),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: ColorsManager.primaryColor,
                                            width: 2,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withValues(
                                                alpha: 0.1,
                                              ),
                                              blurRadius: 10,
                                              spreadRadius: 2,
                                            ),
                                          ],
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          size: 35,
                                          color: Colors.white,
                                        ),
                                      ),
                                      verticalSpace12,
                                      Text(
                                        appTranslation().get('mobile_or_email'),
                                        style:
                                            TextStylesManager.bold16.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      verticalSpace8,
                                      PrimaryTextField(
                                        fillColor: Colors.white,
                                        controller: cubit.emailController,
                                        hint: appTranslation().get(
                                          'mobile_or_email',
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.email_outlined,
                                        ),
                                      ),
                                      verticalSpace12,
                                      Text(
                                        appTranslation().get('password'),
                                        style:
                                            TextStylesManager.bold16.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      verticalSpace8,
                                      PrimaryTextField(
                                        fillColor: Colors.white,
                                        controller: cubit.passwordController,
                                        hint: appTranslation().get('password'),
                                        isPassword: !cubit.isShowPassword,
                                        prefixIcon:
                                            const Icon(Icons.lock_outline),
                                        suffixIcon: IconButton(
                                          onPressed: () =>
                                              cubit.changePasswordVisibility(),
                                          icon: Icon(
                                            cubit.isShowPassword
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                        ),
                                      ),
                                      verticalSpace10,
                                      Align(
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            appTranslation()
                                                .get('forgot_password'),
                                            style: TextStyle(
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ),
                                      ),
                                      verticalSpace20,
                                      Row(
                                        children: [
                                          Expanded(
                                            child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                side: const BorderSide(
                                                  color: Colors.white,
                                                  width: 1.5,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 14,
                                                ),
                                              ),
                                              onPressed: () => context
                                                  .push(Routes.register),
                                              child: Text(
                                                appTranslation()
                                                    .get('register'),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          horizontalSpace14,
                                          Expanded(
                                            child: ConditionalBuilder(
                                              loadingState: state
                                                  is AuthLoginLoadingState,
                                              successBuilder: (context) =>
                                                  PrimaryElevatedButton(
                                                text: appTranslation()
                                                    .get('login'),
                                                radius: 30,
                                                height: 52,
                                                onPressed: () async {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    await cubit.login();
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      verticalSpace20,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      verticalSpace40,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
