import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/routes.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';
import 'package:shefaa/features/register/presentation/screen/widget/form_register.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(appTranslation().get('create_account')),
              verticalSpace16,

              Text(
                appTranslation().get('shefaa'),
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
    );
  }
}
