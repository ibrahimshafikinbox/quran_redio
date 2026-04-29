# 🏛️ Main & Home Features Documentation

This document provides a technical overview of the **Main** and **Home** features implemented in this branch.

---

## 📂 Directory Structure

The features follow a modular architecture:
- **`lib/features/main/`**: Handles the primary navigation shell.
  - `main_view.dart`: The entry point after onboarding, containing the `BottomNavigationBar`.
- **`lib/features/home/`**: Contains the dashboard logic and UI.
  - `view/home_view.dart`: The main dashboard screen.
  - `widget/`: Modular UI components (Header, Categories, Now Playing, etc.).

---

## 📝 Code Explanation

### 1. `MainNavigationPage`
This widget serves as the application's root navigation container. It uses an `IndexedStack` to preserve the state of different tabs (Home, Quran, Radio, etc.) without rebuilding them every time the user switches tabs.

### 2. `HomeView`
The dashboard is built using a `Column` with a fixed `HomeHeaderWidget` and a scrollable body. It integrates a **Sleep Timer** feature managed via a modal bottom sheet.

---

## 🔍 Explanation of Commented Lines (Important)

In `main_view.dart` and `home_view.dart`, you might notice some code is commented out. Here is why:

- **Missing Feature Imports**: Lines like `// QuranPageView()`, `// CitiesSelectionView()`, and `// PrayerTimesScreen()` are commented because these features are currently being developed in separate branches or have not been refactored yet to fit the new directory structure.
- **GlobalKeys**: The `// GlobalKey<QuranPageViewState>` is commented to avoid compilation errors until the `QuranPage` feature is fully integrated.
- **Future Navigation**: Some navigation callbacks (e.g., `// onCategoryTap`) are left as empty placeholders or comments to be implemented once the destination screens are ready.

---

## 🎨 Design System Integration

- **Spacing**: We transitioned from `AppSizedBox` to a unified `Spacing` helper (`Spacing.v16`, `Spacing.h8`) for better consistency.
- **Theming**: All components now strictly use `AppColors` and `AppTextStyle` from the Core layer to ensure a premium, unified look.
- **Responsiveness**: All sizes, margins, and icons are wrapped in `.w`, `.h`, or `.sp` using `flutter_screenutil`.

---

## 🛠️ How to Enable Commented Features?
Once a new feature (e.g., Prayer Times) is ready:
1. Copy the feature folder into `lib/features/`.
2. Uncomment the import in `main_view.dart`.
3. Uncomment the corresponding widget in the `pages` list.

---
