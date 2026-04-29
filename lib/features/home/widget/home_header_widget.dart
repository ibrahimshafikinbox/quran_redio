import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/colors/app_colors.dart';
import 'package:splash/core/helpers/spacing.dart';
import 'package:splash/core/widgets/islamic_lines.dart';
import 'home_header_actions_row.dart';
import 'home_radio_title_widget.dart';
import 'home_date_badge_widget.dart';
import 'home_now_playing_widget.dart';
import 'home_schedule_button.dart';

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
        color: AppColors.primary,
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
                  Spacing.v16,
                  const HomeRadioTitleWidget(),
                  Spacing.v16,
                  const HomeDateBadgeWidget(
                    date: 'الخميس، 9 جمادى الأولى 1445 هـ',
                  ),
                  Spacing.v16,
                  HomeNowPlayingWidget(
                    programName: 'فى ظلال الهدى النبوى',
                    presenterName: 'مع د عبدالصمد الدسوقي',
                  ),
                  Spacing.v20,
                  HomeScheduleButton(onTap: onScheduleTap),
                  Spacing.v16,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
