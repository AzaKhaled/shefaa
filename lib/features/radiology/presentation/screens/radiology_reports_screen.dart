import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';
import 'package:shefaa/features/radiology/presentation/widgets/latest_radiology_card_widget.dart';
import 'package:shefaa/features/radiology/presentation/widgets/radiology_history_card_widget.dart';

class RadiologyReportsScreen extends StatelessWidget {
  const RadiologyReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.background,
      appBar: AppBar(
        backgroundColor: ColorsManager.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorsManager.primaryColor,
          ),
          onPressed: () => context.pop,
        ),
        title: Text(
          appTranslation().get('medical_records'),
          style: TextStylesManager.bold16.copyWith(
            color: ColorsManager.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: ColorsManager.textSecondary,
            ),
            onPressed: () {},
          ),
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appTranslation().get('scans_and_imaging'),
              style: TextStylesManager.bold10.copyWith(
                color: ColorsManager.textSecondary,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              appTranslation().get('radiology_reports_title'),
              style: TextStylesManager.bold24.copyWith(
                color: ColorsManager.primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              appTranslation().get('radiology_reports_desc'),
              style: TextStylesManager.regular14.copyWith(
                color: ColorsManager.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            LatestRadiologyCardWidget(
              title: 'MRI Full Brain Scan',
              subtitle: 'Neuro-Radiology Department',
              date: 'Oct 12, 2023',
              center: 'Advanced Imaging Lab',
              onViewImage: () {},
              onDownload: () {},
            ),
            const SizedBox(height: 24),
            RadiologyHistoryCardWidget(
              title: 'Chest X-Ray (PA View)',
              date: 'Sep 15, 2023',
              center: 'City Medical Center',
              icon: Icons.calendar_today_outlined,
              hasDicom: true,
              onDownload: () {},
              onView: () {},
            ),
            const SizedBox(height: 16),
            RadiologyHistoryCardWidget(
              title: 'Abdominal Ultrasound',
              date: 'Aug 22, 2023',
              center: 'Radiant Scans Inc.',
              icon: Icons.ac_unit_outlined, // Closer to the starburst icon in mockup
              hasDicom: false,
              onDownload: () {},
              onView: () {},
            ),
            const SizedBox(height: 16),
            RadiologyHistoryCardWidget(
              title: 'DEXA Bone Density',
              date: 'Mar 04, 2023',
              center: 'HealthFirst Diagnostics',
              icon: Icons.monitor_weight_outlined,
              hasDicom: false,
              onDownload: () {},
            ),
            const SizedBox(height: 24),
            _buildDicomNotice(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildDicomNotice() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9EFEA), // Light orange/red background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_outline,
            color: Color(0xFFC05C3B), // Brownish orange
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              appTranslation().get('dicom_notice'),
              style: TextStylesManager.regular12.copyWith(
                color: const Color(0xFF5A3C31), // Dark brown
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
