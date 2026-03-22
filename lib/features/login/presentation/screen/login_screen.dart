import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/primary/primary_elevated_button.dart';
import 'package:shefaa/core/utils/constants/primary/primary_text_field.dart';
import 'package:shefaa/core/utils/constants/routes.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isShowPassword = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
                            padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    style: TextStylesManager.bold16.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  verticalSpace8,
                                  PrimaryTextField(
                                    fillColor: Colors.white,
                                    controller: emailController,

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
                                    style: TextStylesManager.bold16.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  verticalSpace8,
                                  PrimaryTextField(
                                    fillColor: Colors.white,
                                    controller: passwordController,
                                    hint: appTranslation().get('password'),
                                    isPassword: !isShowPassword,
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    suffixIcon: IconButton(
                                      onPressed: () => setState(
                                        () => isShowPassword = !isShowPassword,
                                      ),
                                      icon: Icon(
                                        isShowPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                  ),
                                  verticalSpace10,
                                  Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        appTranslation().get('forgot_password'),
                                        style: TextStyle(color: Colors.white70),
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
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 14,
                                            ),
                                          ),
                                          onPressed: () =>
                                              context.push(Routes.register),
                                          child: Text(
                                            appTranslation().get('register'),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      horizontalSpace14,
                                      Expanded(
                                        child: PrimaryElevatedButton(
                                          text: appTranslation().get('login'),
                                          isLoading: isLoading,
                                          radius: 30,
                                          height: 52,
                                          onPressed: () {},
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
  }
}
