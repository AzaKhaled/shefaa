import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/primary/conditional_builder.dart';
import 'package:shefaa/core/utils/constants/primary/primary_elevated_button.dart';
import 'package:shefaa/core/utils/constants/primary/primary_text_field.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/cubit/auth/auth_cubit.dart';
import 'package:shefaa/core/utils/cubit/auth/auth_state.dart';
import 'package:shefaa/features/register/presentation/screen/widget/gender_selector.dart';
import 'package:shefaa/features/register/presentation/screen/widget/terms_checkbox.dart';

class FormRegister extends StatelessWidget {
  const FormRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final cubit = AuthCubit.get(context);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  appTranslation().get('full_name'),
                  style: TextStylesManager.bold16.copyWith(
                    color: ColorsManager.textPrimary,
                  ),
                ),
                verticalSpace8,
                PrimaryTextField(
                  controller: cubit.fullNameController,
                  hint: appTranslation().get('full_name'),
                ),
                verticalSpace12,
                Text(
                  appTranslation().get('national_id'),
                  style: TextStylesManager.bold16.copyWith(
                    color: ColorsManager.textPrimary,
                  ),
                ),
                verticalSpace8,
                PrimaryTextField(
                  controller: cubit.nationalIdController,
                  hint: '123-456-789',
                ),
                verticalSpace10,
                Text(
                  appTranslation().get('mobile_number'),
                  style: TextStylesManager.bold16.copyWith(
                    color: ColorsManager.textPrimary,
                  ),
                ),
                verticalSpace8,
                PrimaryTextField(
                  controller: cubit.phoneController,
                  hint: '123-456-789',
                ),
                verticalSpace10,
                Text(
                  appTranslation().get('email'),
                  style: TextStylesManager.bold16.copyWith(
                    color: ColorsManager.textPrimary,
                  ),
                ),
                verticalSpace8,
                PrimaryTextField(
                  controller: cubit.emailController,
                  hint: appTranslation().get('email'),
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                verticalSpace12,
                Row(
                  children: [
                    Expanded(
                      child: DateField(
                        controller: cubit.dateController,
                        onTap: () => cubit.selectDate(context),
                      ),
                    ),
                    horizontalSpace12,
                    Expanded(
                      child: GenderSelector(
                        selectedGender: cubit.selectedGender,
                        onChanged: (value) {
                          cubit.changeGender(value);
                        },
                      ),
                    ),
                  ],
                ),
                verticalSpace10,
                Text(
                  appTranslation().get('password'),
                  style: TextStylesManager.bold16.copyWith(
                    color: ColorsManager.textPrimary,
                  ),
                ),
                verticalSpace8,
                PrimaryTextField(
                  controller: cubit.passwordController,
                  hint: appTranslation().get('password'),
                  isPassword: !cubit.isShowPassword,
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () => cubit.changePasswordVisibility(),
                    icon: Icon(
                      cubit.isShowPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                verticalSpace10,
                Text(
                  appTranslation().get('confirm_password'),
                  style: TextStylesManager.bold16.copyWith(
                    color: ColorsManager.textPrimary,
                  ),
                ),
                verticalSpace8,
                PrimaryTextField(
                  controller: cubit.confirmPasswordController,
                  hint: appTranslation().get('confirm_password'),
                  isPassword: !cubit.isShowPassword,
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () => cubit.changePasswordVisibility(),
                    icon: Icon(
                      cubit.isShowPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                verticalSpace20,
                TermsAndConditionsCheckbox(onSelected: (value) {}),
                verticalSpace20,
                ConditionalBuilder(
                  loadingState: state is AuthRegisterLoadingState,
                  successBuilder: (context) => PrimaryElevatedButton(
                    text: appTranslation().get('create_account'),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        if (cubit.fullNameController.text.isEmpty ||
                            cubit.phoneController.text.isEmpty ||
                            cubit.nationalIdController.text.isEmpty ||
                            cubit.emailController.text.isEmpty ||
                            cubit.passwordController.text.isEmpty ||
                            cubit.confirmPasswordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                appTranslation().get('fill_all_fields'),
                              ),
                            ),
                          );
                          return;
                        }
                        if (cubit.passwordController.text !=
                            cubit.confirmPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                appTranslation().get('password_mismatch'),
                              ),
                            ),
                          );
                          return;
                        }
                        await cubit.register();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
