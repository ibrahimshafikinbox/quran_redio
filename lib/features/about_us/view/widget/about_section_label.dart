import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/theme/app_text_styles.dart';
 
class AboutSectionLabel extends StatelessWidget {
  final String title;

  const AboutSectionLabel({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 4.w),
      child: Text(title, style: AppTextStyle.textStyleBoldBlack),
    );
  } 
}
