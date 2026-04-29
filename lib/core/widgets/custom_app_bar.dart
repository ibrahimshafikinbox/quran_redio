import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'islamic_lines.dart';
import '../colors/app_colors.dart';
import '../theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.actions,
    this.showBackButton = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.primary),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(painter: IslamicCurvedLinesPainter()),
          ),
          SafeArea(
            child: SizedBox(
              height: 60.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    if (showBackButton)
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                          size: 20.sp,
                        ),
                        onPressed: onBackPressed ?? () => Navigator.pop(context),
                      )
                    else
                      SizedBox(width: 40.w),
                    Expanded(
                      child: Center(
                        child: Text(
                          title,
                          style: AppTextStyles.font18SemiBoldBlack.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    if (actions != null)
                      ...actions!
                    else
                      SizedBox(width: 40.w),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
