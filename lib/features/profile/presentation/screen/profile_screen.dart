import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/cubit/theme/theme_cubit.dart';
import 'package:shefaa/core/utils/cubit/theme/theme_state.dart';
import 'package:shefaa/features/profile/presentation/screen/widgets/profile_header_widget.dart';
import 'package:shefaa/features/profile/presentation/screen/widgets/profile_stats_widget.dart';
import 'package:shefaa/features/profile/presentation/screen/widgets/profile_settings_list_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsManager.background,
          appBar: AppBar(
            backgroundColor: ColorsManager.background,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Text(
              appTranslation().get('profile'),
              style: TextStylesManager.bold16.copyWith(
                color: ColorsManager.textPrimary,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  themeCubit.isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                  color: ColorsManager.textPrimary,
                ),
                onPressed: () => themeCubit.changeTheme(),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                verticalSpace24,
                ProfileHeaderWidget(),
                verticalSpace24,
                ProfileStatsWidget(),
                verticalSpace32,
                ProfileSettingsListWidget(),
                verticalSpace40,
              ],
            ),
          ),
        );
      },
    );
  }
}