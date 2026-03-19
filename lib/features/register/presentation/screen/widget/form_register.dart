import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/primary/primary_elevated_button.dart';
import 'package:shefaa/core/utils/constants/primary/primary_text_field.dart';
import 'package:shefaa/core/utils/constants/routes.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';
import 'package:shefaa/features/register/presentation/screen/widget/gender_selector.dart';
import 'package:shefaa/features/register/presentation/screen/widget/terms_checkbox.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isShowPassword = false;
  bool isLoading = false;
  final TextEditingController dateController = TextEditingController();
  int selectedGender = 0;

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      dateController.text = "${picked.month}/${picked.day}/${picked.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Form(
        key: _formKey,
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
              fillColor: Colors.white,
              controller: emailController,

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
              fillColor: Colors.white,
              controller: passwordController,
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
              fillColor: Colors.white,
              controller: passwordController,
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
              fillColor: Colors.white,
              controller: emailController,

              hint: appTranslation().get('email'),
              prefixIcon: const Icon(Icons.email_outlined),
            ),
            verticalSpace12,
            Row(
              children: [
                Expanded(
                  child: DateField(
                    controller: dateController,
                    onTap: _selectDate,
                  ),
                ),
                horizontalSpace12,
                Expanded(
                  child: GenderSelector(
                    selectedGender: selectedGender,
                    onChanged: (value) {
                      setState(() => selectedGender = value);
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
              fillColor: Colors.white,
              controller: passwordController,
              hint: appTranslation().get('password'),
              isPassword: !isShowPassword,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                onPressed: () =>
                    setState(() => isShowPassword = !isShowPassword),
                icon: Icon(
                  isShowPassword ? Icons.visibility_off : Icons.visibility,
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
              fillColor: Colors.white,
              controller: passwordController,
              hint: appTranslation().get('password'),
              isPassword: !isShowPassword,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                onPressed: () =>
                    setState(() => isShowPassword = !isShowPassword),
                icon: Icon(
                  isShowPassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            verticalSpace20,
            TermsAndConditionsCheckbox(onSelected: (value) {}),
            verticalSpace20,
            PrimaryElevatedButton(
              isLoading: isLoading,
              text: appTranslation().get('create_account'),
              onPressed: () {
                context.push(Routes.otp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
