import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/features/prescriptions/presentation/widgets/medication_card_widget.dart';

class ActiveMedicationsListWidget extends StatelessWidget {
  const ActiveMedicationsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "الأدوية النشطة", // forced from design instead of active since it was requested
              style: TextStylesManager.bold16.copyWith(color: ColorsManager.primaryColor), 
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '3 نشط', 
                style: TextStylesManager.regular12.copyWith(color: ColorsManager.textPrimary),
              ),
            ),
          ],
        ),
        verticalSpace16,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: ColorsManager.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "د. سارة جينكينز",
                style: TextStylesManager.bold14.copyWith(color: Colors.white),
              ),
              Text(
                "24 أكتوبر 2023",
                style: TextStylesManager.regular12.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        verticalSpace8,
        MedicationCardWidget(
          title: "اموكسيسيلين",
          subtitle: "500 مجم • حبوب",
          icon: Icons.medication,
          badgeText: appTranslation().get('current_medication'),
          frequencyValue: "مرتين يومياً",
          durationTitle: appTranslation().get('duration'),
          durationValue: "10 أيام",
        ),
        verticalSpace8,
        MedicationCardWidget(
          title: "ليسينوبريل",
          subtitle: "10 مجم • يومياً",
          icon: Icons.vaccines,
          badgeText: appTranslation().get('chronic_medication'),
          frequencyValue: "مرة واحدة يومياً",
          durationTitle: appTranslation().get('next_dispense'),
          durationValue: "30 يوم",
        ),
        verticalSpace8,
        MedicationCardWidget(
          title: "اموكسيسيلين",
          subtitle: "500 مجم • حبوب",
          icon: Icons.medication,
          badgeText: appTranslation().get('current_medication'),
          frequencyValue: "مرتين يومياً",
          durationTitle: appTranslation().get('duration'),
          durationValue: "10 أيام",
        ),
      ],
    );
  }
}
