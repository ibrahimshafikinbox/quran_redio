import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Spacing {
  Spacing._();

  static SizedBox v4 = SizedBox(height: 4.h);
  static SizedBox v8 = SizedBox(height: 8.h);
  static SizedBox v12 = SizedBox(height: 12.h);
  static SizedBox v16 = SizedBox(height: 16.h);
  static SizedBox v20 = SizedBox(height: 20.h);
  static SizedBox v24 = SizedBox(height: 24.h);
  static SizedBox v32 = SizedBox(height: 32.h);
  static SizedBox v40 = SizedBox(height: 40.h);
  static SizedBox v48 = SizedBox(height: 48.h);

  static SizedBox h4 = SizedBox(width: 4.w);
  static SizedBox h8 = SizedBox(width: 8.w);
  static SizedBox h12 = SizedBox(width: 12.w);
  static SizedBox h16 = SizedBox(width: 16.w);
  static SizedBox h20 = SizedBox(width: 20.w);
  static SizedBox h24 = SizedBox(width: 24.w);
  static SizedBox h32 = SizedBox(width: 32.w);
}

extension SpacingExtension on num {
  SizedBox get verticalSpace => SizedBox(height: h.toDouble());
  SizedBox get horizontalSpace => SizedBox(width: w.toDouble());
}
