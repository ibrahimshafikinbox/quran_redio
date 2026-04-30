import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/colors/app_colors.dart';

class HomeCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const HomeCategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeCategoryIconContainer(icon: icon),
            SizedBox(height: 10.h),
            HomeCategoryTitle(title: title),
          ],
        ),
      ),
    );
  }
}

class HomeCategoryIconContainer extends StatelessWidget {
  final IconData icon;

  const HomeCategoryIconContainer({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.beige,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(icon, color: AppColors.goldText, size: 28.sp),
    );
  }
}

class HomeCategoryTitle extends StatelessWidget {
  final String title;

  const HomeCategoryTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
