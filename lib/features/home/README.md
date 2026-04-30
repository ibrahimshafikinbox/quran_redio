# 🏠 Home Feature: Detailed Documentation

This feature serves as the primary dashboard of the Quran Radio application. It is designed to be highly modular, responsive, and strictly integrated with the application's core design system.

---

## 📂 Feature Architecture & Directory Breakdown

### 1. `view/home_view.dart`
The entry point of the Home feature.
- **`HomeView` (StatefulWidget)**: Manages the high-level state of the dashboard, specifically the **Sleep Timer** logic.
- **`_showSleepTimer()`**: An asynchronous function that opens the `SleepTimerBottomSheet`. It waits for a result (seconds) and updates the local state to trigger the timer UI.
- **`Scaffold`**: Uses `AppColors.white` for a clean look and sets the base `Directionality` to RTL.

### 2. `widget/` (Modular UI Components)

#### 🏛️ `home_header_widget.dart`
- **Purpose**: Displays the top section with a custom curved background.
- **Implementation**: Uses `CustomPaint` with `IslamicCurvedLinesPainter` to render traditional Islamic patterns dynamically.
- **Integration**: Combines `HomeHeaderActionsRow`, `HomeRadioTitleWidget`, and `HomeNowPlayingWidget` into a cohesive header unit.

#### 🔔 `home_header_actions_row.dart`
- **Logic**: Handles the top buttons (Menu, Notifications, and Sleep Timer).
- **UI**: The timer icon changes appearance (`isActive`) if a sleep timer is currently running, giving the user immediate visual feedback.

#### 📻 `home_now_playing_widget.dart`
- **Content**: Displays the name of the current program and the presenter.
- **Styling**: Uses `AppTextStyle.textStyleWhiteSemiBold` to ensure readability against the dark green primary background.

#### 📅 `home_date_badge_widget.dart`
- **Design**: A subtle, semi-transparent capsule that displays the Hijri date.
- **Colors**: Uses `AppColors.white.withOpacity(0.12)` to maintain a premium "glassmorphism" aesthetic.

#### 📑 `home_categories_section.dart` & `home_category_card.dart`
- **Grid System**: Uses `GridView.builder` with a `SliverGridDelegate` for a responsive 2-column layout.
- **Logic**: Maps a list of `CategoryItem` objects to UI cards.
- **Styling**: The cards use `AppColors.beige` for the icon background and `AppColors.goldText` for the icons, matching the overall color palette.

#### ⏲️ `sleep_timer_widget.dart`
- **Logic**: A complex widget managing duration selection.
- **Presets**: Includes quick-select buttons for 30m, 1.5h, and 2h.
- **Custom Picker**: Uses `ListWheelScrollView` to create a smooth, native-feeling time picker for Hours, Minutes, and Seconds.
- **Data Flow**: When "Start Timer" is clicked, it calculates total seconds and returns it via `Navigator.pop(context, totalSeconds)`.

---

## 🎨 Design System & Color Logic

All components in this feature strictly utilize the **Centralized Design System** located in `lib/core/`:

- **Colors (`AppColors`)**:
  - `primary`: Used for headers and main buttons.
  - `goldText` & `beige`: Used for category cards to provide a warm, premium feel.
  - `textPrimary`: Used for main body text to ensure high contrast and readability.
- **Typography (`AppTextStyle`)**: Every `Text` widget uses a predefined style from the core layer to ensure font consistency (Cairo) across the app.
- **Spacing (`Spacing`)**: Instead of hardcoded `SizedBox`, we use `Spacing.v16`, `Spacing.h12`, etc., to maintain a perfect layout grid.

---

## 🔍 Note on Commented Code

- **Feature Placeholders**: Navigation to screens like `QiblahView` or `QuranPageView` is currently commented or uses `Scaffold()` because those features are being refactored in separate branches to match this new modular structure.
- **Future Integration**: The logic is already prepared for `Cubit` integration; once the radio service is ready, the hardcoded program names in `HomeNowPlayingWidget` will be replaced with dynamic state streams.

---
