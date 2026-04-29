import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_radio/core/utils/colors/colors.dart';
import 'package:quran_radio/core/utils/styles/app_sized_box.dart';
import 'package:quran_radio/core/widgets/islamic_lines.dart';
import 'package:quran_radio/feature/home/widget/home_header_actions_row.dart';
import 'package:quran_radio/feature/home/widget/home_radio_title_widget.dart';
import 'package:quran_radio/feature/home/widget/home_date_badge_widget.dart';
import 'package:quran_radio/feature/home/widget/home_now_playing_widget.dart';
import 'package:quran_radio/feature/home/widget/home_schedule_button.dart';

class HomeHeaderWidget extends StatelessWidget {
  final int? sleepTimerSeconds;
  final VoidCallback onTimerTap;
  final VoidCallback onNotificationTap;
  final VoidCallback onMenuTap;
  final VoidCallback onScheduleTap;

  const HomeHeaderWidget({
    super.key,
    this.sleepTimerSeconds,
    required this.onTimerTap,
    required this.onNotificationTap,
    required this.onMenuTap,
    required this.onScheduleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28.r),
          bottomRight: Radius.circular(28.r),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28.r),
          bottomRight: Radius.circular(28.r),
        ),
        child: CustomPaint(
          painter: IslamicCurvedLinesPainter(),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  HomeHeaderActionsRow(
                    sleepTimerSeconds: sleepTimerSeconds,
                    onTimerTap: onTimerTap,
                    onNotificationTap: onNotificationTap,
                    onMenuTap: onMenuTap,
                  ),
                  AppSizedBox.sizedH15,
                  const HomeRadioTitleWidget(),
                  AppSizedBox.sizedH15,
                  const HomeDateBadgeWidget(
                    date: 'الخميس، 9 جمادى الأولى 1445 هـ',
                  ),
                  AppSizedBox.sizedH15,
                  const HomeNowPlayingWidget(
                    programName: 'فى ظلال الهدى النبوى',
                    presenterName: 'مع د عبدالصمد الدسوقي',
                  ),
                  AppSizedBox.sizedH20,
                  HomeScheduleButton(onTap: onScheduleTap),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
