# 🏠 Home Feature Documentation

This folder contains the **Home** feature, which serves as the primary dashboard of the application after the user finishes the onboarding process.

## 📂 Feature Structure

The feature is organized following a clean, modular structure:

- **`view/`**: Contains the main screen layouts.
  - `home_view.dart`: The primary dashboard widget that assembles all components.
- **`widget/`**: Contains small, reusable UI components specific to the Home feature.
  - `home_header_widget.dart`: The decorative top section with Islamic patterns.
  - `home_categories_section.dart`: A grid of different radio categories.
  - `sleep_timer_widget.dart`: A specialized bottom sheet for the sleep timer functionality.
  - `home_now_playing_widget.dart`: Displays the current radio program information.

---

## 🔍 Explanation of Commented Lines

To ensure the project remains buildable while other features are under development, some lines have been intentionally commented:

1. **Feature Navigation**: 
   - `// CategoryItem(..., screen: QiblahView())`: Commented because the Qiblah feature is yet to be refactored and merged into this branch. A `Scaffold()` placeholder is used instead for now.
2. **Callback Logic**:
   - `// onCategoryTap: (String category) {}`: Left as a comment in the categories section to be implemented once the detailed category views are ready.
3. **Data Placeholders**:
   - Some static data (like dates) are currently hardcoded but are structured to be replaced by dynamic data from a Cubit or Repository later.

---

## 🛠️ Technical Details

### 1. Theming & Styling
The Home feature is fully integrated with the **Core Design System**:
- **Colors**: Uses `AppColors.primary` and `AppColors.white`.
- **Typography**: Strictly follows `AppTextStyle` (e.g., `textStyleBoldBlack`, `textStyleWhiteMedium`).
- **Spacing**: Uses the centralized `Spacing` helper (e.g., `Spacing.v16`, `Spacing.h12`) to maintain a consistent layout grid.

### 2. Responsiveness
All dimensions are handled via `flutter_screenutil` using `.w`, `.h`, and `.sp` extensions to ensure the dashboard looks premium on all screen sizes.

---
