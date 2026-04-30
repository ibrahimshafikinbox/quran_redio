import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/widgets/custom_bottom_navbar.dart' show CustomBottomNavBar;
import 'package:splash/features/home/view/home_view.dart';
import 'package:splash/features/settings/view/settings_view.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int currentIndex = 0;

  static const int _quranTabIndex = 1;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const HomeView(),
      const Scaffold(body: Center(child: Text('المصحف - قريباً'))),
      const Scaffold(body: Center(child: Text('بث مباشر - قريباً'))),
      const Scaffold(body: Center(child: Text('الصلاة - قريباً'))),
      const SettingsView(),
    ];
  }

  void onTabSelected(int index) {
    setState(() => currentIndex = index);

    if (index == _quranTabIndex) {
      // _quranPageKey.currentState?.refreshLastRead();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: IndexedStack(index: currentIndex, children: pages),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: currentIndex,
          onTap: onTabSelected,
        ),
      ),
    );
  }
}
