import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/colors/app_colors.dart';

class SettingsModeToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsModeToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 60.w,
      height: 28.h,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: value ? AppColors.primary : AppColors.textSecondary.withOpacity(0.2),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.wb_sunny_outlined,
              size: 16.sp,
              color: value ? AppColors.white.withOpacity(0.5) : AppColors.white,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.nightlight_round,
              size: 16.sp,
              color: value ? AppColors.white : AppColors.textSecondary.withOpacity(0.6),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => onChanged(!value),
              child: Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.15),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onChanged(!value),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
