import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/colors/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle font24BoldBlack = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
    fontFamily: 'Cairo',
  );

  static TextStyle font20BoldBlack = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
    fontFamily: 'Cairo',
  );

  static TextStyle font18SemiBoldBlack = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textBlack,
    fontFamily: 'Cairo',
  );

  static TextStyle font16MediumBlack = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textBlack,
    fontFamily: 'Cairo',
  );

  static TextStyle font14RegularBlack = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textBlack,
    fontFamily: 'Cairo',
  );

  static TextStyle font14MediumGray = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    fontFamily: 'Cairo',
  );

  static TextStyle font16SemiBoldPrimary = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    fontFamily: 'Cairo',
  );

  static TextStyle font16BoldWhite = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
    fontFamily: 'Cairo',
  );

  static TextStyle font12RegularGray = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textGray,
    fontFamily: 'Cairo',
  );
}
