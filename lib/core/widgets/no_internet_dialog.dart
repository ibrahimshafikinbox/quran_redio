import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../helpers/spacing.dart';

class NoInternetDialog extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetDialog({super.key, required this.onRetry});

  static Future<void> show(BuildContext context, VoidCallback onRetry) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => NoInternetDialog(onRetry: onRetry),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.wifi_off_rounded,
                size: 80.sp,
                color: AppColors.warning,
              ),
              Spacing.v16,
              Text(
                'لا يوجد اتصال بالإنترنت',
                style: AppTextStyle.textStyleBoldBlack,
                textAlign: TextAlign.center,
              ),
              Spacing.v12,
              Text(
                'يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى',
                style: AppTextStyle.textStyleMediumGray,
                textAlign: TextAlign.center,
              ),
              Spacing.v24,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onRetry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'إعادة المحاولة',
                    style: AppTextStyle.textStyleWhiteSemiBold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
