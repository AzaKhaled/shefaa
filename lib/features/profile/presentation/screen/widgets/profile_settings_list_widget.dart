import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/routes.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/cubit/theme/theme_cubit.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';

class ProfileSettingsListWidget extends StatelessWidget {
  const ProfileSettingsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appTranslation().get('account_settings'),
          style: TextStylesManager.bold12.copyWith(
            color: ColorsManager.textSecondary,
            letterSpacing: 1.0,
          ),
        ),
        verticalSpace16,
        _SettingsTileWidget(
          title: appTranslation().get('personal_information'),
          icon: Icons.person_outline,
          onTap: () {
            context.push(Routes.personalInformation);
          },
        ),
        verticalSpace12,
        _SettingsTileWidget(
          title: appTranslation().get('medical_history'),
          icon: Icons.article_outlined,
          onTap: () {},
        ),
        verticalSpace12,
        _SettingsTileWidget(
          title: appTranslation().get('notification_settings'),
          icon: Icons.notifications_none_outlined,
          onTap: () {},
        ),
        verticalSpace12,
        _SettingsTileWidget(
          title: appTranslation().get('security_privacy'),
          icon: Icons.shield_outlined,
          onTap: () {},
        ),
        verticalSpace12,
        _LanguageTileWidget(),
        verticalSpace12,
        _SettingsTileWidget(
          title: appTranslation().get('log_out'),
          icon: Icons.logout,
          isLogout: true,
          onTap: () {},
        ),
      ],
    );
  }
}

class _SettingsTileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isLogout;

  const _SettingsTileWidget({
    required this.title,
    required this.icon,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isLogout ? Colors.red.withValues(alpha: 0.05) : ColorsManager.surfacePrimary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isLogout ? Colors.red.withValues(alpha: 0.1) : ColorsManager.borderColor),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isLogout ? Colors.red.withValues(alpha: 0.1) : ColorsManager.primaryAction.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isLogout ? Colors.redAccent : ColorsManager.primaryAction,
                size: 20,
              ),
            ),
            horizontalSpace16,
            Expanded(
              child: Text(
                title,
                style: TextStylesManager.bold14.copyWith(
                  color: isLogout ? Colors.redAccent : ColorsManager.textPrimary,
                ),
              ),
            ),
            if (!isLogout)
              Icon(
                Icons.chevron_right,
                color: ColorsManager.textSecondary,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}

class _LanguageTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsManager.borderColor),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorsManager.primaryAction.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.language,
              color: ColorsManager.primaryAction,
              size: 20,
            ),
          ),
          horizontalSpace16,
          Expanded(
            child: Text(
              appTranslation().get('language'),
              style: TextStylesManager.bold14.copyWith(
                color: ColorsManager.textPrimary,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorsManager.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _LanguageToggleButton(
                  title: 'EN',
                  isSelected: !themeCubit.isArabicLang,
                  onTap: () {
                    if (themeCubit.isArabicLang) themeCubit.changeLanguage();
                  },
                ),
                _LanguageToggleButton(
                  title: 'AR',
                  isSelected: themeCubit.isArabicLang,
                  onTap: () {
                    if (!themeCubit.isArabicLang) themeCubit.changeLanguage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageToggleButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageToggleButton({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.primaryAction : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStylesManager.bold12.copyWith(
            color: isSelected ? Colors.white : ColorsManager.textSecondary,
          ),
        ),
      ),
    );
  }
}
