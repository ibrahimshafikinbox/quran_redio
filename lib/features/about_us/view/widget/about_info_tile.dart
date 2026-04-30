import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/colors/app_colors.dart';

class AboutInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final bool showArrow;
  final bool isLast;
  final VoidCallback? onTap;

  const AboutInfoTile({
    super.key,
    required this.icon,
    required this.label,
    this.value,
    this.showArrow = false,
    this.isLast = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: isLast
                ? BorderRadius.vertical(bottom: Radius.circular(16.r))
                : null,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Row(
                children: [
                  Icon(icon, color: AppColors.primary, size: 24.sp),
                  SizedBox(width: 14.w),
                  Expanded(child: _buildText()),
                  if (showArrow)
                    Icon(
                      Icons.arrow_back_ios,
                      size: 14.sp,
                      color: Colors.grey[400],
                    ),
                ],
              ),
            ),
          ),
        ),
        if (!isLast) _buildDivider(),
      ],
    );
  }

  Widget _buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1A1A1A),
          ),
        ),
        if (value != null) ...[
          SizedBox(height: 2.h),
          Text(
            value!,
            style: TextStyle(fontSize: 13.sp, color: Colors.grey[500]),
          ),
        ],
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 54.w),
      child: Divider(height: 1, color: Colors.grey[200]),
    );
  }
}
