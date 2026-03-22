import 'package:flutter/material.dart';
import 'package:shefaa/core/network/local/cache_helper.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/assets_helper.dart';
import 'package:shefaa/core/utils/constants/primary/primary_elevated_button.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/routes.dart';
import 'package:shefaa/features/onboarding/data/models/onboarding_model.dart';
import 'package:shefaa/features/onboarding/presentation/widgets/page_indicator.dart';
import 'package:shefaa/features/onboarding/presentation/widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<OnboardingModel> _onboardingPages = [
    OnboardingModel(
      title: appTranslation().get('onboarding_title_1'),
      description: appTranslation().get('onboarding_desc_1'),
      image: AssetsHelper.doctor,
    ),
    OnboardingModel(
      title: appTranslation().get('onboarding_title_2'),
      description: appTranslation().get('onboarding_desc_2'),
      image: AssetsHelper.doctor,
    ),
    OnboardingModel(
      title: appTranslation().get('onboarding_title_3'),
      description: appTranslation().get('onboarding_desc_3'),
      image: AssetsHelper.doctor2,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _skipOnboarding() {
    _completeOnboarding();
  }

  void _completeOnboarding() async {
    await CacheHelper.saveData(key: 'onboardingCompleted', value: true);
    if (mounted) {
      context.pushReplacement(Routes.guest);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.background,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _skipOnboarding,
                    child: Text(
                      appTranslation().get('skip'),
                      style: TextStylesManager.regular14.copyWith(
                        color: ColorsManager.primaryAction,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Pages
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _onboardingPages.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(model: _onboardingPages[index]);
                },
              ),
            ),

            // Page Indicator
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: PageIndicator(
                currentPage: _currentPage,
                totalPages: _onboardingPages.length,
              ),
            ),

            // Next Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: PrimaryElevatedButton(
                text: _currentPage == _onboardingPages.length - 1
                    ? appTranslation().get('login')
                    : appTranslation().get('next'),
                onPressed: _nextPage,
                height: 54,
                radius: 12,
                backgroundColor: ColorsManager.primaryAction,
                textStyle: TextStylesManager.bold16.copyWith(
                  color: Colors.white,
                ),
              ),
            ),

            verticalSpace24,
          ],
        ),
      ),
    );
  }
}
