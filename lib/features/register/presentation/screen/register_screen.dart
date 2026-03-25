import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/routes.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';
import 'package:shefaa/core/utils/cubit/auth/auth_cubit.dart';
import 'package:shefaa/core/utils/cubit/auth/auth_state.dart';
import 'package:shefaa/features/register/presentation/screen/widget/form_register.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthRegisterSuccessState) {
          context.push(Routes.home);
        } else if (state is AuthRegisterErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message,
              ),
            ),
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text(appTranslation().get('create_account')),
                verticalSpace16,
                Text(
                  appTranslation().get('app_name'),
                  style: TextStylesManager.bold24.copyWith(
                    color: ColorsManager.primaryAction,
                  ),
                ),
                verticalSpace16,
                Align(
                  child: Text(
                    appTranslation().get('fill_details'),
                    textAlign: TextAlign.center,
                  ),
                ),
                FormRegister(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      appTranslation().get('have_account'),
                      style: TextStylesManager.regular14.copyWith(
                        color: ColorsManager.textSecondary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.push(Routes.login);
                      },
                      child: Text(
                        appTranslation().get('login_here'),
                        style: TextStylesManager.bold14.copyWith(
                          color: ColorsManager.primaryAction,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
