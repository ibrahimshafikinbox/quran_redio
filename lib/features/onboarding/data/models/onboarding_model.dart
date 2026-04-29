import 'package:flutter/material.dart';

class OnboardingModel {
  final IconData icon;
  final String title;
  final String subtitle;
  final String description;

  OnboardingModel({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
  });
}

final List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    icon: Icons.menu_book_rounded,
    title: 'القرآن الكريم',
    subtitle: 'استمع إلى القرآن الكريم',
    description: 'استمتع بتلاوة القرآن الكريم بأصوات أشهر القراء في العالم الإسلامي في أي وقت وأي مكان',
  ),
  OnboardingModel(
    icon: Icons.radio_rounded,
    title: 'البث الإذاعي',
    subtitle: 'إذاعات إسلامية متنوعة',
    description: 'استمع إلى أفضل الإذاعات الإسلامية المباشرة من جميع أنحاء العالم العربي والإسلامي',
  ),
  OnboardingModel(
    icon: Icons.favorite_rounded,
    title: 'تجربة روحانية',
    subtitle: 'السكينة والطمأنينة',
    description: 'اجعل القرآن الكريم رفيقك اليومي وأحط نفسك بالأجواء الإسلامية الهادئة في كل لحظة',
  ),
];
