import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/colors/app_colors.dart';
import 'package:splash/core/theme/app_text_styles.dart';
import 'package:splash/core/helpers/spacing.dart';
import '../../data/models/onboarding_model.dart';

class OnboardingPageItem extends StatelessWidget {
  final OnboardingModel data;

  const OnboardingPageItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon Container
          Container(
            width: 150.w,
            height: 150.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withOpacity(0.08),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.15),
                width: 2,
              ),
            ),
            child: Icon(
              data.icon,
              size: 64.sp,
              color: AppColors.primary,
            ),
          ),

          Spacing.v40,

          // Subtitle chip
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.primary.withOpacity(0.08),
            ),
            child: Text(
              data.subtitle,
              style: AppTextStyle.textStyleMediumGray12.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Spacing.v16,

          // Title
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleBoldBlack20.copyWith(
              height: 1.4,
            ),
          ),

          Spacing.v16,

          // Description
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleRegularGray.copyWith(
              height: 1.9,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
