# 🚀 Onboarding Feature

This feature provides a clean and engaging introduction for new users, highlighting the key features of the application.

## 📂 Structure
- **`data/models/`**: Contains `OnboardingModel` for page data.
- **`logic/cubit/`**: Contains `OnboardingCubit` and `OnboardingState` for business logic and state management.
- **`presentation/views/`**: Contains `OnboardingView`, which is now a `StatelessWidget`.
- **`presentation/widgets/`**: Contains sub-widgets like `OnboardingPageItem` and `OnboardingDotsIndicator`.

## 🛠️ Implementation Details
- **Separation of Concerns**: The View is completely free of logic, using `flutter_bloc` (Cubit) to handle state and user interactions.
- **Responsive UI**: Fully integrated with `flutter_screenutil` for all sizes and spacing.
- **Theming**: Uses `AppColors` and `AppTextStyles` from the core layer.
- **Persistence**: Saves `onboarding_seen` flag in `SharedPreferences` via the Cubit.

## 🎨 Core Integration
- Uses `CustomButton` from `core/widgets`.
- Uses `Spacing` and `NavigationExtensions` for cleaner code.
