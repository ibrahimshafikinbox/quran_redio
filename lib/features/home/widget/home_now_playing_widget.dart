import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_radio/core/utils/styles/app_text_style.dart';

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
        Text('تستمعون الان', style: AppTextStyle.textStyleWhiteMedium),
        Text(
          programName,
          style: AppTextStyle.textStyleWhiteSemiBold.copyWith(fontSize: 18.sp),
        ),
        Text(presenterName, style: AppTextStyle.textStyleWhiteMedium),
      ],
    );
  }
}
