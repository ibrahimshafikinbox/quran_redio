import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/theme/app_text_styles.dart';
import 'package:splash/core/helpers/spacing.dart';

class HomeNowPlayingWidget extends StatelessWidget {
  final String programName;
  final String presenterName;

  const HomeNowPlayingWidget({
    super.key,
    required this.programName,
    required this.presenterName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'تستمعون الان',
          style: AppTextStyle.textStyleWhiteMedium,
        ),
        Spacing.v4,
        Text(
          programName,
          textAlign: TextAlign.center,
          style: AppTextStyle.textStyleWhiteSemiBold.copyWith(
            fontSize: 18.sp,
          ),
        ),
        Spacing.v4,
        Text(
          presenterName,
          style: AppTextStyle.textStyleWhiteMedium,
        ),
      ],
    );
  }
}
