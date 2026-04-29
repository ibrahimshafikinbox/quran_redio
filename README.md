# 📖 Quran App - Core Foundation

This project follows a clean and structured architecture designed for scalability and maintainability. This document provides a detailed overview of the **Core** folder and the shared utilities implemented to streamline feature development.

---

## 🏗️ Architecture Overview

The project is divided into two main sections:
1. **Core**: Contains all shared resources, themes, services, and global widgets that are used across multiple features.
2. **Features**: Contains independent modules for each application feature (e.g., Splash, Home, Radio). Each feature follows a clean folder structure (Data, Domain, Presentation).

---

## 🛠️ Core Components Breakdown

### 🎨 1. Theme & Colors (`lib/core/colors/` & `lib/core/theme/`)
- **`AppColors`**: A centralized source of truth for all color constants.
  - *Usage*: `color: AppColors.primary`
- **`AppTextStyles`**: Standardized text styles using `flutter_screenutil` for responsive typography.
  - *Usage*: `style: AppTextStyles.font18SemiBoldBlack`

### 🧩 2. Reusable Widgets (`lib/core/widgets/`)
- **`CustomButton`**: A flexible button component with a built-in Islamic decorative background and loading state support.
- **`CustomAppBar`**: A stylized AppBar that maintains a consistent look across the app.
- **`ConnectivityWrapper`**: A top-level widget that automatically checks for internet connection and displays a retry dialog if disconnected.
- **`IslamicCurvedLinesPainter`**: A custom painter used to add elegant Islamic-style patterns to UI elements.

### 🚀 3. Helpers & Extensions (`lib/core/helpers/`)
- **`Spacing`**: Simplifies responsive spacing using ScreenUtil.
  - *Usage*: `Spacing.v16` (Vertical 16h), `Spacing.h8` (Horizontal 8w).
- **`NavigationExtensions`**: Provides a cleaner syntax for navigation via `BuildContext`.
  - *Usage*: `context.push(NewPage())`, `context.pop()`.
- **`LastReadHelper`**: Manages saving and retrieving the last read position in the Quran using `shared_preferences`.

### 📡 4. Services (`lib/core/services/`)
- **`ConnectivityService`**: Handles real-time internet connectivity checks.
- **`UrlLauncherService`**: Provides methods to safely open external URLs or WhatsApp chats.

### 🔢 5. Constants (`lib/core/constants/`)
- **`AppConstants`**: Stores global strings and configuration keys.
- **`AssetConstants`**: Centralized paths for all images and icons to prevent hardcoded string errors.

---

## 📱 Responsive Design
The project heavily utilizes **`flutter_screenutil`**. 
- Always use `.w` for widths.
- Always use `.h` for heights.
- Always use `.sp` for font sizes.
- Always use `.r` for border radius.

---

## 🛠️ How to use this Core in a new Feature?
When creating a new feature:
1. Use `AppColors` for all colors.
2. Use `AppTextStyles` for all text.
3. Use `context.push()` for navigation.
4. Wrap your main screen with `ConnectivityWrapper` if it requires internet.

---

## 📄 Documentation Summary (العربية)
تم تأسيس مجلد الـ Core ليكون القاعدة الصلبة للمشروع، حيث يحتوي على:
- **نظام ألوان موحد** يسهل تغييره مستقبلاً.
- **نظام خطوط متجاوب** يعمل بشكل مثالي على جميع أحجام الشاشات.
- **ودجات جاهزة** (Widgets) مثل الأزرار والـ AppBar لضمان توحيد التصميم.
- **أدوات مساعدة** لتسهيل التنقل بين الشاشات وإدارة المسافات.

---
