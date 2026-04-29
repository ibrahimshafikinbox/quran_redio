import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_radio/core/utils/styles/app_sized_box.dart';

class HomeHeaderActionsRow extends StatelessWidget {
  final int? sleepTimerSeconds;
  final VoidCallback onTimerTap;
  final VoidCallback onNotificationTap;
  final VoidCallback onMenuTap;

  const HomeHeaderActionsRow({
    super.key,
    this.sleepTimerSeconds,
    required this.onTimerTap,
    required this.onNotificationTap,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HomeHeaderIconButton(
          icon: Icons.timer_outlined,
          isActive: sleepTimerSeconds != null,
          onTap: onTimerTap,
        ),
        const Spacer(),
        HomeHeaderIconButton(
          icon: Icons.notifications,
          onTap: onNotificationTap,
        ),
        AppSizedBox.sizedW10,
        HomeHeaderIconButton(icon: Icons.menu, onTap: onMenuTap),
      ],
    );
  }
}

class HomeHeaderIconButton extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const HomeHeaderIconButton({
    super.key,
    required this.icon,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, color: Colors.white, size: 24.sp),
      ),
    );
  }
}
