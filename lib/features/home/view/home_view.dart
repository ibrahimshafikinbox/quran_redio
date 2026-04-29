import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_radio/core/utils/colors/colors.dart';
import 'package:quran_radio/core/utils/styles/app_sized_box.dart';
import 'package:quran_radio/feature/home/widget/home_header_widget.dart';
import 'package:quran_radio/feature/home/widget/home_categories_section.dart';
import 'package:quran_radio/feature/home/widget/sleep_timer_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? _sleepTimerSeconds;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            HomeHeaderWidget(
              sleepTimerSeconds: _sleepTimerSeconds,
              onTimerTap: _showSleepTimer,
              onNotificationTap: () {},
              onMenuTap: () {},
              onScheduleTap: () {},
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppSizedBox.sizedH15,
                    HomeCategoriesSection(
                      onViewAllTap: () {},
                      // onCategoryTap: (String category) {},
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSleepTimer() async {
    final result = await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const Directionality(
        textDirection: TextDirection.rtl,
        child: SleepTimerBottomSheet(),
      ),
    );

    if (result != null && result > 0) {
      setState(() {
        _sleepTimerSeconds = result;
      });
      _startSleepTimer(result);
    }
  }

  void _startSleepTimer(int seconds) {
    debugPrint('Sleep timer started for $seconds seconds');
  }
}
