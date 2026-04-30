import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/colors/app_colors.dart';

class HomeDateBadgeWidget extends StatelessWidget {
  final String date;

  const HomeDateBadgeWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        date,
        style: TextStyle(color: AppColors.white, fontSize: 13.sp),
      ),
    );
  }
}
