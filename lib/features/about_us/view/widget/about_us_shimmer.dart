import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:splash/core/colors/app_colors.dart';

class AboutUsShimmer extends StatelessWidget {
  const AboutUsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.w),
      children: [
        _buildDeveloperCardShimmer(),
        SizedBox(height: 24.h),
        _buildLabelShimmer(),
        SizedBox(height: 12.h),
        _buildSectionCardShimmer(itemCount: 4),
        SizedBox(height: 24.h),
        _buildLabelShimmer(),
        SizedBox(height: 12.h),
        _buildSectionCardShimmer(itemCount: 2),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _shimmerBox({
    required double width,
    required double height,
    double radius = 8,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(radius.r),
        ),
      ),
    );
  }

  Widget _buildDeveloperCardShimmer() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.06),
            blurRadius: 20.r,
            offset: Offset(0, 6.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              _shimmerBox(width: 72.w, height: 72.w, radius: 18),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerBox(width: 60.w, height: 22.h, radius: 8),
                  SizedBox(height: 8.h),
                  _shimmerBox(width: 120.w, height: 18.h, radius: 6),
                  SizedBox(height: 6.h),
                  _shimmerBox(width: 160.w, height: 14.h, radius: 6),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Container(height: 1, color: AppColors.textSecondary.withOpacity(0.1)),
          SizedBox(height: 16.h),
          Row(
            children: [
              _shimmerBox(width: 40.w, height: 16.h, radius: 4),
              const Spacer(),
              _shimmerBox(width: 44.w, height: 36.h, radius: 12),
              SizedBox(width: 10.w),
              _shimmerBox(width: 44.w, height: 36.h, radius: 12),
              SizedBox(width: 10.w),
              _shimmerBox(width: 44.w, height: 36.h, radius: 12),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLabelShimmer() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 4.w),
      child: _shimmerBox(width: 80.w, height: 18.h, radius: 6),
    );
  }

  Widget _buildSectionCardShimmer({required int itemCount}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.04),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        children: List.generate(itemCount, (index) {
          final isLast = index == itemCount - 1;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                child: Row(
                  children: [
                    _shimmerBox(width: 36.w, height: 36.w, radius: 10),
                    SizedBox(width: 14.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _shimmerBox(width: 80.w, height: 13.h, radius: 4),
                        SizedBox(height: 6.h),
                        _shimmerBox(width: 140.w, height: 13.h, radius: 4),
                      ],
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 66.w),
                  child: Container(height: 1, color: AppColors.textSecondary.withOpacity(0.05)),
                ),
            ],
          );
        }),
      ),
    );
  }
}
