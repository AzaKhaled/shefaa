import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';
import 'package:shefaa/features/appointment/presentation/screen/widgets/booking_progress_widget.dart';
import 'package:shefaa/core/utils/constants/primary/primary_elevated_button.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.background,
      appBar: AppBar(
        backgroundColor: ColorsManager.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorsManager.textPrimary),
          onPressed: () => context.pop,
        ),
        title: Text(
          appTranslation().get('book_appointment'),
          style: TextStylesManager.bold16.copyWith(
            color: ColorsManager.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookingProgressWidget(
                title: appTranslation().get('choose_date_time'),
                step: appTranslation().get('step_3_of_4'),
                progress: 0.75,
              ),
              verticalSpace24,
              _buildCalendar(),
              verticalSpace24,
              _buildTimeSection(
                title: appTranslation().get('morning'),
                icon: Icons.wb_sunny_outlined,
                times: ['09:00 AM', '09:30 AM', '10:00 AM', '11:00 AM'],
              ),
              verticalSpace24,
              _buildTimeSection(
                title: appTranslation().get('afternoon'),
                icon: Icons.wb_sunny,
                times: ['01:00 PM', '02:30 PM', '03:00 PM', '04:30 PM'],
              ),
              verticalSpace24,
              _buildTimeSection(
                title: appTranslation().get('evening'),
                icon: Icons.nights_stay_outlined,
                times: ['06:00 PM', '07:30 PM'],
              ),
              verticalSpace40,
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildCalendar() {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: ColorsManager.primaryAction,
            onPrimary: Colors.white,
            onSurface: ColorsManager.textPrimary,
          ),
        ),
        child: CalendarDatePicker(
          initialDate: _selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateChanged: (date) {
            setState(() {
              _selectedDate = date;
            });
          },
        ),
      ),
    );
  }

  Widget _buildTimeSection({
    required String title,
    required IconData icon,
    required List<String> times,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: ColorsManager.primaryAction),
            horizontalSpace8,
            Text(
              title,
              style: TextStylesManager.bold14.copyWith(
                color: ColorsManager.textPrimary,
              ),
            ),
          ],
        ),
        verticalSpace16,
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: times.map((time) {
            final isSelected = _selectedTime == time;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTime = time;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? ColorsManager.primaryAction
                      : ColorsManager.primaryAction.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  time,
                  style: TextStylesManager.regular12.copyWith(
                    color: isSelected
                        ? Colors.white
                        : ColorsManager.primaryAction,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        border: Border(top: BorderSide(color: ColorsManager.borderColor)),
      ),
      child: PrimaryElevatedButton(
        text: appTranslation().get('continue'),
        onPressed: _selectedTime != null
            ? () {
                // Navigate to next step
              }
            : null,
        backgroundColor: ColorsManager.primaryAction,
        radius: 24,
        icon: const Icon(
          Icons.arrow_forward,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
