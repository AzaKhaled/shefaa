import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/di/injections.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/assets_helper.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/constants/primary/primary_text_field.dart';
import 'package:shefaa/core/utils/constants/primary/primary_elevated_button.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';
import 'package:shefaa/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:shefaa/features/profile/presentation/cubit/profile_state.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final nameController = TextEditingController();
  final nationalIdController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final emergencyNameController = TextEditingController();
  final emergencyPhoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    nationalIdController.dispose();
    dobController.dispose();
    genderController.dispose();
    phoneController.dispose();
    emailController.dispose();
    emergencyNameController.dispose();
    emergencyPhoneController.dispose();
    super.dispose();
  }

  void _populateControllers(ProfileState state) {
    if (state is ProfileSuccessState) {
      final user = state.profileModel.data?.user;
      final patient = state.profileModel.data?.patient;

      nameController.text = user?.name ?? '';
      nationalIdController.text = patient?.nationalId ?? '';
      dobController.text = patient?.dateOfBirth?.split('T').first ?? '';
      genderController.text = patient?.gender ?? '';
      phoneController.text = user?.phone ?? '';
      emailController.text = user?.email ?? '';
      emergencyNameController.text = patient?.emergencyContactName ?? '';
      emergencyPhoneController.text = patient?.emergencyContactPhone ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileCubit>()..getPatientProfile(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileSuccessState) {
            _populateControllers(state);

          }
          if (state is UpdateProfileSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile updated successfully!'), backgroundColor: Colors.green),
            );
            context.pop;
          }
          if (state is UpdateProfileErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          var cubit = ProfileCubit.get(context);
          var patient = cubit.profileModel?.data?.patient;

          return Scaffold(
            backgroundColor: ColorsManager.background,
            appBar: AppBar(
              backgroundColor: ColorsManager.background,
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: ColorsManager.textPrimary),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                appTranslation().get('personal_information'),
                style: TextStylesManager.bold16.copyWith(color: ColorsManager.textPrimary),
              ),
              centerTitle: true,
            ),
            body: state is ProfileLoadingState
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  verticalSpace24,
                  _buildProfileImage(),
                  verticalSpace12,
                  Text(
                    nameController.text.isNotEmpty ? nameController.text : '---',
                    style: TextStylesManager.bold18.copyWith(color: ColorsManager.textPrimary),
                  ),
                  verticalSpace4,
                  Text(
                    'Patient ID: #${patient?.patientCode ?? '---'}',
                    style: TextStylesManager.regular14.copyWith(color: ColorsManager.textSecondary),
                  ),
                  verticalSpace32,
                  _buildSection(
                    title: appTranslation().get('basic_details'),
                    icon: Icons.person_outline,
                    color: ColorsManager.primaryAction,
                    children: [
                      _buildField(label: appTranslation().get('full_name'), controller: nameController),
                      verticalSpace16,
                      _buildField(label: appTranslation().get('national_id'), controller: nationalIdController),
                      verticalSpace16,
                      _buildField(
                        label: appTranslation().get('date_of_birth'),
                        controller: dobController,
                        suffixIcon: Icons.calendar_today_outlined,
                      ),
                      verticalSpace16,
                      _buildField(
                        label: appTranslation().get('gender'),
                        controller: genderController,
                        suffixIcon: Icons.keyboard_arrow_down,
                        readOnly: true,
                      ),
                    ],
                  ),
                  verticalSpace24,
                  _buildSection(
                    title: appTranslation().get('contact_details'),
                    icon: Icons.phone_outlined,
                    color: ColorsManager.primaryAction,
                    children: [
                      _buildField(
                        label: appTranslation().get('phone_number'),
                        controller: phoneController,
                        suffixIcon: Icons.phone_iphone_outlined,
                      ),
                      verticalSpace16,
                      _buildField(
                        label: appTranslation().get('email'),
                        controller: emailController,
                        suffixIcon: Icons.email_outlined,
                      ),
                    ],
                  ),
                  verticalSpace24,
                  _buildSection(
                    title: appTranslation().get('emergency_contact'),
                    icon: Icons.emergency_outlined,
                    color: Colors.redAccent,
                    children: [
                      _buildField(label: appTranslation().get('contact_name'), controller: emergencyNameController),
                      verticalSpace16,
                      _buildField(
                        label: appTranslation().get('phone_number'),
                        controller: emergencyPhoneController,
                        suffixIcon: Icons.phone_outlined,
                      ),
                    ],
                  ),
                  verticalSpace32,
                  state is UpdateProfileLoadingState
                      ? const CircularProgressIndicator()
                      : PrimaryElevatedButton(
                    text: appTranslation().get('save_changes'),
                    onPressed: () {
                      cubit.updatePatientProfile(
                        name: nameController.text,
                        phone: phoneController.text,
                        email: emailController.text,
                        nationalId: nationalIdController.text,
                        dateOfBirth: dobController.text,
                        gender: genderController.text,
                        emergencyContactName: emergencyNameController.text,
                        emergencyContactPhone: emergencyPhoneController.text,
                      );
                    },
                    icon: const Icon(Icons.save_outlined, color: Colors.white, size: 20),
                  ),
                  verticalSpace16,
                  Text(
                    appTranslation().get('hipaa_compliance'),
                    textAlign: TextAlign.center,
                    style: TextStylesManager.regular12.copyWith(color: ColorsManager.textSecondary),
                  ),
                  verticalSpace40,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManager.surfacePrimary,
            border: Border.all(color: ColorsManager.primaryColor.withValues(alpha: 0.1), width: 4),
            image: const DecorationImage(image: AssetImage(AssetsHelper.person), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: ColorsManager.primaryColor,
              shape: BoxShape.circle,
              border: Border.all(color: ColorsManager.background, width: 2),
            ),
            child: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Color color,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsManager.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              horizontalSpace8,
              Text(title, style: TextStylesManager.bold14.copyWith(color: color)),
            ],
          ),
          verticalSpace16,
          ...children,
        ],
      ),
    );
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    IconData? suffixIcon,
    bool readOnly = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStylesManager.regular12.copyWith(color: ColorsManager.textSecondary)),
        verticalSpace8,
        PrimaryTextField(
          controller: controller,
          hint: '',
          readOnly: readOnly,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: ColorsManager.textSecondary, size: 20) : null,
          fillColor: ColorsManager.background,
        ),
      ],
    );
  }
}