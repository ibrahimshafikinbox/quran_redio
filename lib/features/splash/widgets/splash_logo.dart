import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/constants/asset_constants.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetConstants.logo,
      width: 200.w,
      height: 200.h,
      fit: BoxFit.contain,
    );
  }
}
