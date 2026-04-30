import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/colors/app_colors.dart';
import 'package:splash/core/theme/app_text_styles.dart';

class SettingsRow extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final Widget? trailing;
  final String? trailingText;
  final VoidCallback? onTap;

  const SettingsRow({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.trailing,
    this.trailingText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final rowContent = Row(
      children: [
        Icon(leadingIcon, color: AppColors.primary, size: 22.sp),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            title,
            style: AppTextStyle.textStyleBoldBlack.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if (trailing != null)
          trailing!
        else if (trailingText != null)
          Text(
            trailingText!,
            style: AppTextStyle.textStyleMediumGray.copyWith(
              fontSize: 13.sp,
            ),
          ),
      ],
    );

    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: rowContent,
      ),
    );
  }
}

class SettingsDividerLine extends StatelessWidget {
  const SettingsDividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 0.8,
      color: AppColors.scaffoldBg,
      indent: 16.w,
      endIndent: 16.w,
    );
  }
}
