import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/colors/app_colors.dart';
import 'package:splash/core/theme/app_text_styles.dart';
import 'package:splash/core/helpers/spacing.dart';
import 'package:splash/core/helpers/extensions.dart';
import 'package:splash/core/widgets/custom_button.dart';
import 'package:splash/features/onboarding/data/models/onboarding_model.dart' show onboardingPages;
import '../logic/cubit/onboarding_cubit.dart';
import '../widgets/onboarding_page_item.dart';
import '../widgets/onboarding_dots_indicator.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: const OnboardingBody(),
    );
  }
}

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            int currentIndex = cubit.currentPageIndex;
            return Column(
              children: [
                // Skip Button
                SizedBox(
                  height: 48.h,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: currentIndex < onboardingPages.length - 1
                        ? TextButton(
                            onPressed: () => _finishOnboarding(context),
                            child: Text(
                              'تخطي',
                              style: AppTextStyle.textStyleRegularGrayLight.copyWith(
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
                    controller: cubit.pageController,
                    itemCount: onboardingPages.length,
                    onPageChanged: (index) => cubit.updatePageIndex(index),
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
                        currentIndex: currentIndex,
                      ),

                      Spacing.v24,

                      // Button
                      CustomButton(
                        text: currentIndex < onboardingPages.length - 1
                            ? 'التالي'
                            : 'ابدأ الآن',
                        onPressed: () {
                          if (currentIndex < onboardingPages.length - 1) {
                            cubit.next();
                          } else {
                            _finishOnboarding(context);
                          }
                        },
                        icon: currentIndex < onboardingPages.length - 1
                            ? Icons.arrow_back_ios_rounded
                            : Icons.done_rounded,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _finishOnboarding(BuildContext context) {
    context.read<OnboardingCubit>().setOnboardingSeen();
    // Navigate to Home
    context.pushReplacement(const Scaffold(body: Center(child: Text('Home Screen'))));
  }
}
