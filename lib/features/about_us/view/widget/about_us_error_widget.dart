import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/colors/app_colors.dart';
import 'package:splash/features/about_us/cubit/about_us_cubit.dart';

class AboutUsErrorWidget extends StatelessWidget {
  final String message;

  const AboutUsErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: 64.sp,
              color: AppColors.textSecondary.withOpacity(0.2),
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton.icon(
              onPressed: () {
                context.read<AboutUsCubit>().fetchAboutUs();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              icon: Icon(Icons.refresh_rounded, size: 18.sp),
              label: Text(
                'إعادة المحاولة',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
