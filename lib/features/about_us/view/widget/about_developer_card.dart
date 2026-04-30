import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:splash/core/colors/app_colors.dart';
import 'package:splash/core/constants/asset_constants.dart';
import 'about_social_chip.dart';

class AboutDeveloperCard extends StatelessWidget {
  final String companyName;
  final String companySpecialty;
  final String? facebookUrl;
  final String? twitterUrl;
  final String? linkedinUrl;

  const AboutDeveloperCard({
    super.key,
    required this.companyName,
    required this.companySpecialty,
    this.facebookUrl,
    this.twitterUrl,
    this.linkedinUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.06),
            blurRadius: 20.r,
            offset: Offset(0, 6.h),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildCompanyRow(),
          SizedBox(height: 20.h),
          Container(height: 1, color: AppColors.textSecondary.withValues(alpha: 0.1)),
          SizedBox(height: 16.h),
          _buildSocialRow(),
        ],
      ),
    );
  }

  Widget _buildCompanyRow() {
    return Row(
      children: [
        _buildLogo(),
        SizedBox(width: 16.w),
        Expanded(child: _buildCompanyInfo()),
      ],
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 72.w,
      height: 72.w,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAF9),
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Image.asset(
          AssetConstants.companyLogo,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.business_rounded,
              size: 32.sp,
              color: AppColors.primary.withValues(alpha: 0.4),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            'المطوّر',
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          companyName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          companySpecialty,
          style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildSocialRow() {
    return Row(
      children: [
        Text(
          'تابعنا',
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        const Spacer(),
        if (facebookUrl != null)
          AboutSocialChip(
            icon: Icons.facebook_rounded,
            color: const Color(0xFF1877F2),
            onTap: () {},
          ),
        if (facebookUrl != null) SizedBox(width: 10.w),
        if (twitterUrl != null)
          AboutSocialChip(
            socialType: SocialType.twitter,
            color: const Color(0xFF000000),
            onTap: () {},
          ),
        if (twitterUrl != null) SizedBox(width: 10.w),
        if (linkedinUrl != null)
          AboutSocialChip(
            socialType: SocialType.linkedIn,
            color: const Color(0xFF0A66C2),
            onTap: () {},
          ),
      ],
    );
  }
}
