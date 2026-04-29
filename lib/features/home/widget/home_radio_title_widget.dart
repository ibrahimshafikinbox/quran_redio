import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/colors/app_colors.dart';

class HomeRadioTitleWidget extends StatelessWidget {
  const HomeRadioTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'إِذَاعَةُ القُرْآنِ الكَرِيمِ\n مِنَ القَاهِرَةِ',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Cairo',
      ),
    );
  }
}
