import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash/core/colors/app_colors.dart';
import 'package:splash/core/theme/app_text_styles.dart';
import 'package:splash/core/helpers/spacing.dart';
import 'package:splash/core/helpers/extensions.dart';
import 'package:splash/core/widgets/custom_button.dart';
import 'package:splash/features/onboarding/data/models/onboarding_model.dart' show onboardingPages;
 import '../widgets/onboarding_page_item.dart';
import '../widgets/onboarding_dots_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_seen', true);
  }

  Future<void> _onFinishPressed() async {
    await _setOnboardingSeen();
    // Navigate to next screen (Home/Login)
    if (mounted) {
      context.pushReplacement(const Scaffold(body: Center(child: Text('Home Screen Placeholder'))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            SizedBox(
              height: 48.h,
              child: Align(
                alignment: Alignment.centerLeft,
                child: _currentPageIndex < onboardingPages.length - 1
                    ? TextButton(
                        onPressed: _onFinishPressed,
                        child: Text(
                          'تخطي',
                          style: AppTextStyles.font14RegularBlack.copyWith(
                            color: AppColors.textGray,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),

            // Pages
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingPages.length,
                onPageChanged: (index) =>
                    setState(() => _currentPageIndex = index),
                itemBuilder: (context, index) =>
                    OnboardingPageItem(data: onboardingPages[index]),
              ),
            ),

            // Bottom Section
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
              child: Column(
                children: [
                  OnboardingDotsIndicator(
                    itemCount: onboardingPages.length,
                    currentIndex: _currentPageIndex,
                  ),

                  Spacing.v24,

                  // Button
                  CustomButton(
                    text: _currentPageIndex < onboardingPages.length - 1
                        ? 'التالي'
                        : 'ابدأ الآن',
                    onPressed: () {
                      if (_currentPageIndex < onboardingPages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        _onFinishPressed();
                      }
                    },
                    icon: _currentPageIndex < onboardingPages.length - 1
                        ? Icons.arrow_back_ios_rounded
                        : Icons.done_rounded,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
