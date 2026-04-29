import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'islamic_lines.dart';
import '../colors/app_colors.dart';
import '../theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? AppColors.primary;
    final radius = borderRadius ?? 25.r;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.h,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(radius),
              boxShadow: [
                BoxShadow(
                  color: bgColor.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(painter: IslamicCurvedLinesPainter()),
                  ),
                  Center(
                    child: isLoading
                        ? SizedBox(
                            width: 24.w,
                            height: 24.w,
                            child: CircularProgressIndicator(
                              color: textColor ?? AppColors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (icon != null) ...[
                                Icon(
                                  icon,
                                  color: textColor ?? AppColors.white,
                                  size: 20.sp,
                                ),
                                SizedBox(width: 10.w),
                              ],
                              Text(
                                text,
                                style: AppTextStyles.font16BoldWhite.copyWith(
                                  color: textColor ?? AppColors.white,
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
