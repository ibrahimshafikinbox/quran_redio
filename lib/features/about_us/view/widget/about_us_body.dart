import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/features/about_us/cubit/about_us_state.dart';
import 'about_developer_card.dart';
import 'about_info_tile.dart';
import 'about_section_card.dart';
import 'about_section_label.dart';

class AboutUsBody extends StatelessWidget {
  final AboutUsLoaded state;

  const AboutUsBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final data = state.data;
    return ListView(
      padding: EdgeInsets.all(20.w),
      children: [
        AboutDeveloperCard(
          companyName: data.companyName,
          companySpecialty: data.companySpecialty,
          facebookUrl: data.facebookUrl,
          twitterUrl: data.twitterUrl,
          linkedinUrl: data.linkedinUrl,
        ),
        SizedBox(height: 24.h),

        const AboutSectionLabel(title: 'التواصل'),
        SizedBox(height: 12.h),
        AboutSectionCard(
          children: [
            AboutInfoTile(
              icon: Icons.apartment_rounded,
              label: 'الشركة المطورة',
              value: data.companyName,
            ),
            AboutInfoTile(
              icon: Icons.email_outlined,
              label: 'البريد الإلكتروني',
              value: data.email,
              onTap: () {},
            ),
            AboutInfoTile(
              icon: Icons.language_rounded,
              label: 'الموقع الإلكتروني',
              value: data.website,
              onTap: () {},
            ),
            AboutInfoTile(
              icon: Icons.phone_outlined,
              label: 'رقم التواصل',
              value: data.phone,
              isLast: true,
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: 24.h),

        const AboutSectionLabel(title: 'التقييمات والدعم'),
        SizedBox(height: 12.h),
        AboutSectionCard(
          children: [
            AboutInfoTile(
              icon: Icons.star_outline_rounded,
              label: 'تقييم التطبيق',
              value: 'ساعدنا بتقييمك',
              showArrow: true,
              onTap: () {},
            ),
            AboutInfoTile(
              icon: Icons.share_outlined,
              label: 'مشاركة التطبيق',
              value: 'شارك الخير مع الآخرين',
              showArrow: true,
              isLast: true,
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
