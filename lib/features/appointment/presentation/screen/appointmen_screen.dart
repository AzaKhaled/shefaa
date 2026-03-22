import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

import 'widgets/booking_progress_widget.dart';
import 'widgets/doctor_card_widget.dart';
import 'widgets/filter_chips_widget.dart';
import 'widgets/search_bar_widget.dart';

class AppointmenScreen extends StatefulWidget {
  const AppointmenScreen({super.key});

  @override
  State<AppointmenScreen> createState() => _AppointmenScreenState();
}

class _AppointmenScreenState extends State<AppointmenScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _doctors = [
    {
      'name': 'Dr. James Wilson',
      'specialty': 'Senior Cardiologist',
      'exp': '12',
      'rating': 4.9,
      'fee': 120,
    },
    {
      'name': 'Dr. Sarah Jenkins',
      'specialty': 'Cardiologist',
      'exp': '8',
      'rating': 4.8,
      'fee': 95,
    },
    {
      'name': 'Dr. Michael Chen',
      'specialty': 'Interventional Cardiology',
      'exp': '15',
      'rating': 5.0,
      'fee': 150,
    },
    {
      'name': 'Dr. Elena Rodriguez',
      'specialty': 'Cardiovascular Surgeon',
      'exp': '10',
      'rating': 4.7,
      'fee': 135,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          appTranslation().get('choose_doctor'),
          style: TextStylesManager.bold18.copyWith(
            color: ColorsManager.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            verticalSpace10,
            BookingProgressWidget(
              title: appTranslation().get('booking_progress'),
              step: appTranslation().get('step_2_of_4'),
              progress: 0.5,
            ),
            verticalSpace20,
            SearchBarWidget(controller: _searchController),
            verticalSpace20,
            FilterChipsWidget(),
            verticalSpace20,
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: _doctors.length,
                separatorBuilder: (context, index) => verticalSpace16,
                itemBuilder: (context, index) {
                  final doctor = _doctors[index];
                  return DoctorCardWidget(doctor: doctor);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
