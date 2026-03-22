import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/cubit/theme/theme_cubit.dart';
import 'package:shefaa/core/utils/cubit/theme/theme_state.dart';
import 'package:shefaa/features/appointment/presentation/screen/appointmen_screen.dart';
import 'package:shefaa/features/doctors/presentation/screen/doctors_screen.dart';
import 'package:shefaa/features/home/presentation/screen/home_screen.dart';
import 'package:shefaa/features/profile/presentation/screen/profile_screen.dart';

class RootScreen extends StatefulWidget {
  final int initialIndex;
  const RootScreen({super.key, this.initialIndex = 1});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final screens = [
          HomeScreen(),
          AppointmenScreen(),
          DoctorsScreen(),
          ProfileScreen(),
        ];

        return Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorsManager.primaryAction,
            unselectedItemColor: ColorsManager.textSecondary,
            backgroundColor: ColorsManager.surfacePrimary,
            selectedLabelStyle: TextStylesManager.bold10.copyWith(height: 1.5),
            unselectedLabelStyle: TextStylesManager.regular10.copyWith(height: 1.5),
            items: [
              BottomNavigationBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.home_outlined),
                ),
                activeIcon: const Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.home),
                ),
                label: appTranslation().get('home'),
              ),
              BottomNavigationBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.calendar_today_outlined),
                ),
                activeIcon: const Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.calendar_today),
                ),
                label: appTranslation().get('appointments'),
              ),
              BottomNavigationBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.people_outline),
                ),
                activeIcon: const Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.people),
                ),
                label: appTranslation().get('doctors'),
              ),
              BottomNavigationBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.person_outline),
                ),
                activeIcon: const Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.person),
                ),
                label: appTranslation().get('profile'),
              ),
            ],
          ),
        );
      },
    );
  }
}
