import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/colors/app_colors.dart' show AppColors;
import 'package:splash/core/helpers/spacing.dart';
import 'package:splash/features/home/widget/home_categories_section.dart' show HomeCategoriesSection;
import 'package:splash/features/home/widget/home_header_widget.dart' show HomeHeaderWidget;
import 'package:splash/features/home/widget/sleep_timer_widget.dart' show SleepTimerBottomSheet;
 

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
                    Spacing.h16,
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
