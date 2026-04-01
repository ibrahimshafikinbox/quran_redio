import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScreenUtils {
  AppScreenUtils._();

  static const Size designSize = Size(375, 812);

  // ── Initialize ScreenUtil ──
  static Future<void> init(BuildContext context) async {
    await ScreenUtil.ensureScreenSize();
  }

  // ── Responsive Padding ──
  static EdgeInsets get paddingAll16 => EdgeInsets.all(16.w);
  static EdgeInsets get paddingAll20 => EdgeInsets.all(20.w);
  static EdgeInsets get paddingH16 => EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets get paddingH24 => EdgeInsets.symmetric(horizontal: 24.w);
  static EdgeInsets get paddingV12 => EdgeInsets.symmetric(vertical: 12.h);
  static EdgeInsets get paddingV24 => EdgeInsets.symmetric(vertical: 24.h);

  // ── Responsive Gaps (Vertical) ──
  static SizedBox get vGap4 => SizedBox(height: 4.h);
  static SizedBox get vGap8 => SizedBox(height: 8.h);
  static SizedBox get vGap12 => SizedBox(height: 12.h);
  static SizedBox get vGap16 => SizedBox(height: 16.h);
  static SizedBox get vGap20 => SizedBox(height: 20.h);
  static SizedBox get vGap24 => SizedBox(height: 24.h);
  static SizedBox get vGap32 => SizedBox(height: 32.h);
  static SizedBox get vGap48 => SizedBox(height: 48.h);

  // ── Responsive Gaps (Horizontal) ──
  static SizedBox get hGap4 => SizedBox(width: 4.w);
  static SizedBox get hGap8 => SizedBox(width: 8.w);
  static SizedBox get hGap12 => SizedBox(width: 12.w);
  static SizedBox get hGap16 => SizedBox(width: 16.w);
  static SizedBox get hGap24 => SizedBox(width: 24.w);

  // ── Responsive Border Radius ──
  static BorderRadius get radius8 => BorderRadius.circular(8.r);
  static BorderRadius get radius12 => BorderRadius.circular(12.r);
  static BorderRadius get radius16 => BorderRadius.circular(16.r);
  static BorderRadius get radius24 => BorderRadius.circular(24.r);
  static BorderRadius get radiusFull => BorderRadius.circular(100.r);

  // ── Responsive Icon Sizes ──
  static double get iconSm => 16.sp;
  static double get iconMd => 24.sp;
  static double get iconLg => 32.sp;
  static double get iconXl => 48.sp;

  // ── Responsive Font Sizes ──
  static double get fontXs => 10.sp;
  static double get fontSm => 12.sp;
  static double get fontMd => 14.sp;
  static double get fontLg => 16.sp;
  static double get fontXl => 20.sp;
  static double get fontXxl => 28.sp;
  static double get fontDisplay => 36.sp;
}
