import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/features/home/data/models/specialty_model.dart';

class SpecialtiesList extends StatelessWidget {
  final List<SpecialtyModel> specialties;
  const SpecialtiesList({super.key, required this.specialties});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              appTranslation().get('specialties'),
              style: TextStylesManager.bold18.copyWith(color: ColorsManager.textPrimary),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                appTranslation().get('see_all'),
                style: TextStylesManager.bold14.copyWith(color: ColorsManager.primaryColor),
              ),
            ),
          ],
        ),
        verticalSpace8,
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: specialties.length,
            separatorBuilder: (context, index) => horizontalSpace16,
            itemBuilder: (context, index) {
              final specialty = specialties[index];
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: ColorsManager.surfacePrimary,
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorsManager.borderColor),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      _getIconData(specialty.icon),
                      color: ColorsManager.primaryColor,
                      size: 28,
                    ),
                  ),
                  verticalSpace8,
                  Text(
                    specialty.name,
                    style: TextStylesManager.bold12.copyWith(color: ColorsManager.textPrimary),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'procedures': return Icons.personal_video_outlined;
      case 'heart': return Icons.favorite_outline;
      case 'tooth': return Icons.health_and_safety_outlined; 
      case 'allergies': return Icons.opacity_outlined;
      case 'ambulance': return Icons.local_shipping_outlined;
      case 'syringe': return Icons.vaccines_outlined;
      case 'head-side-mask': return Icons.medical_services_outlined;
      case 'user-md': return Icons.person_outline;
      case 'notes-medical': return Icons.notes_outlined;
      case 'user-nurse': return Icons.medical_information_outlined;
      case 'female': return Icons.female_outlined;
      case 'vial': return Icons.biotech_outlined;
      case 'virus': return Icons.coronavirus_outlined;
      case 'stethoscope': return Icons.medical_services_outlined;
      case 'tint': return Icons.water_drop_outlined;
      case 'bolt': return Icons.bolt_outlined;
      case 'apple-alt': return Icons.apple_outlined;
      case 'ribbon': return Icons.emoji_events_outlined;
      case 'eye': return Icons.visibility_outlined;
      case 'bone': return Icons.accessible_outlined;
      case 'microscope': return Icons.biotech_outlined;
      case 'child': return Icons.child_care_outlined;
      case 'walking': return Icons.directions_walk_outlined;
      case 'brain': return Icons.psychology_outlined;
      case 'lungs': return Icons.air_outlined;
      case 'x-ray': return Icons.document_scanner_outlined;
      case 'hand-paper': return Icons.pan_tool_outlined;
      case 'running': return Icons.directions_run_outlined;
      case 'scissors': return Icons.content_cut_outlined;
      case 'male': return Icons.male_outlined;
      default: return Icons.medical_services_outlined;
    }
  }
}
