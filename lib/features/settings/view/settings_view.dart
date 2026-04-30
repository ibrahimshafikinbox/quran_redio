import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/colors/app_colors.dart';
import 'package:splash/core/widgets/custom_app_bar.dart';
import 'package:splash/features/about_us/view/about_us_view.dart';
import '../widgets/settings_section_card.dart';
import '../widgets/settings_row.dart';
import '../widgets/settings_mode_toggle.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isDarkMode = false;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBg,
        appBar: CustomAppBar(
          title: "الإعدادات",
          onBackPressed: () {},
          showBackButton: false,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          children: [
            SettingsSectionCard(
              children: [
                SettingsRow(
                  title: 'الوضع الليلي / النهاري',
                  leadingIcon: Icons.wb_sunny_outlined,
                  trailing: SettingsModeToggle(
                    value: isDarkMode,
                    onChanged: (value) => setState(() => isDarkMode = value),
                  ),
                ),
                const SettingsDividerLine(),
                SettingsRow(
                  title: 'مسح الذاكرة المؤقتة',
                  leadingIcon: Icons.cleaning_services_outlined,
                  trailing: Icon(
                    Icons.delete_outline,
                    color: AppColors.primary,
                    size: 22.sp,
                  ),
                  onTap: () {
                    // Logic to clear cache
                  },
                ),
                const SettingsDividerLine(),
                SettingsRow(
                  title: 'الإشعارات',
                  leadingIcon: Icons.notifications_none_outlined,
                  trailing: Switch(
                    value: notificationsEnabled,
                    activeColor: AppColors.primary,
                    onChanged: (value) =>
                        setState(() => notificationsEnabled = value),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            SettingsSectionCard(
              children: [
                SettingsRow(
                  title: 'عن التطبيق',
                  leadingIcon: Icons.privacy_tip_outlined,
                  trailing: Icon(
                    Icons.chevron_left,
                    color: AppColors.textSecondary,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutUsView()),
                    );
                  },
                ),
                const SettingsDividerLine(),
                SettingsRow(
                  title: 'سياسة الخصوصية',
                  leadingIcon: Icons.privacy_tip_outlined,
                  trailing: Icon(
                    Icons.chevron_left,
                    color: AppColors.textSecondary,
                  ),
                  onTap: () {
                    // Navigate to Privacy Policy
                  },
                ),
                const SettingsDividerLine(),
                SettingsRow(
                  title: 'الشروط والأحكام',
                  leadingIcon: Icons.article_outlined,
                  trailing: Icon(
                    Icons.chevron_left,
                    color: AppColors.textSecondary,
                  ),
                  onTap: () {
                    // Navigate to Terms
                  },
                ),
                const SettingsDividerLine(),
                const SettingsRow(
                  title: 'إصدار التطبيق',
                  leadingIcon: Icons.info_outline,
                  trailingText: 'V1.0.1',
                ),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
