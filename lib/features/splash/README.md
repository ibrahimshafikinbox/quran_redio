# 🚀 Splash Feature

This feature handles the application startup experience, including branding and initialization logic.

## 📂 Structure
- **`view/`**: Contains `SplashScreen`, the main entry point for the app.
- **`widgets/`**: Contains `SplashLogo`, a reusable widget for the app logo with responsive sizing.

## 🛠️ Implementation Details
- **Animations**: Uses `AnimationController` and `FadeTransition` for a smooth entry effect.
- **Navigation**: Uses a 5-second timer to navigate to the next screen (currently a placeholder).
- **Branding**: Displays the app logo using `AssetConstants` and uses `AppColors.primary` for the background.

## 🎨 Theme Integration
- Uses `AppColors.primary` for consistent branding.
- Uses `flutter_screenutil` to ensure the logo is perfectly sized on all devices.
