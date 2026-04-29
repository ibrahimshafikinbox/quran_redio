import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/colors/app_colors.dart';
import 'package:splash/core/theme/app_text_styles.dart' show AppTextStyle;
import 'package:splash/features/home/widget/home_category_card.dart';
 

class HomeCategoriesSection extends StatelessWidget {
  final VoidCallback onViewAllTap;

  const HomeCategoriesSection({super.key, required this.onViewAllTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          HomeCategoriesSectionHeader(onViewAllTap: onViewAllTap),
          const HomeCategoriesGrid(),
        ],
      ),
    );
  }
}

class HomeCategoriesSectionHeader extends StatelessWidget {
  final VoidCallback onViewAllTap;

  const HomeCategoriesSectionHeader({super.key, required this.onViewAllTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'روائع إذاعة القرآن الكريم',
          style: AppTextStyle.textStyleBoldBlack.copyWith(
            color: AppColors.primary,
          ),
        ),
        TextButton.icon(
          iconAlignment: IconAlignment.end,
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
            color: AppColors.primary,
          ),
          onPressed: onViewAllTap,
          label: Text(
            'عرض الكل',
            style: AppTextStyle.textStyleBoldBlack.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class HomeCategoriesGrid extends StatelessWidget {
  const HomeCategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      CategoryItem(
        title: 'تلاوات نادرة',
        icon: Icons.queue_music_rounded,
        screen: Scaffold(),
      ),
      CategoryItem(
        title: 'تفاسير مسجلة',
        icon: Icons.menu_book_rounded,
        screen: Scaffold(),
      ),
      CategoryItem(
        title: 'صلوات الجمعة',
        icon: Icons.mosque_rounded,
        screen: Scaffold(),
      ),
            CategoryItem(title: 'القبله', icon: Icons.explore, screen: Scaffold()),
// remove line comment please 
      // CategoryItem(title: 'القبله', icon: Icons.explore, screen: QiblahView()),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14.w,
        mainAxisSpacing: 14.h,
        childAspectRatio: 1.5,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final item = categories[index];

        return HomeCategoryCard(
          title: item.title,
          icon: item.icon,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => item.screen),
            );
          },
        );
      },
    );
  }
}

class CategoryItem {
  final String title;
  final IconData icon;
  final Widget screen;

  CategoryItem({required this.title, required this.icon, required this.screen});
}
