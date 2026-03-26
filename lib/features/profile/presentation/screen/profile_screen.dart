import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/di/injections.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:shefaa/features/profile/presentation/cubit/profile_state.dart';
import 'package:shefaa/features/profile/presentation/screen/widgets/profile_header_widget.dart';
import 'package:shefaa/features/profile/presentation/screen/widgets/profile_stats_widget.dart';
import 'package:shefaa/features/profile/presentation/screen/widgets/profile_settings_list_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileCubit>()..getPatientProfile(),
      child: Scaffold(
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
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            var cubit = ProfileCubit.get(context);
            var user = cubit.profileModel?.data?.user;

            return RefreshIndicator(
              onRefresh: () => cubit.getPatientProfile(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    verticalSpace24,
                    if (state is ProfileLoadingState)
                      const LinearProgressIndicator()
                    else if (state is ProfileErrorState)
                      Text(
                        state.error,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ProfileHeaderWidget(
                      name: user?.name,
                      email: user?.email,
                    ),
                    verticalSpace24,
                    const ProfileStatsWidget(),
                    verticalSpace32,
                    const ProfileSettingsListWidget(),
                    verticalSpace40,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
