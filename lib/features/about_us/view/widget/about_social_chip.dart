import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SocialType { facebook, twitter, linkedIn }

class AboutSocialChip extends StatelessWidget {
  final IconData? icon;
  final Color color;
  final VoidCallback onTap;
  final SocialType? socialType;

  const AboutSocialChip({
    super.key,
    this.icon,
    required this.color,
    required this.onTap,
    this.socialType,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: color.withOpacity(0.15), width: 1),
        ),
        child: _buildIcon(),
      ),
    );
  }

  Widget _buildIcon() {
    if (socialType == SocialType.twitter) {
      return Text(
        '𝕏',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      );
    }

    if (socialType == SocialType.linkedIn) {
      return Text(
        'in',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      );
    }

    return Icon(icon, size: 16.sp, color: color);
  }
}
