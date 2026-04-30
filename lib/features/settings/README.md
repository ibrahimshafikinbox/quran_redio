# ⚙️ Settings Feature - Overview

The Settings page allows users to customize their experience within the app, such as switching between Light and Dark modes, managing notifications, and clearing saved data. It is built to be simple, clean, and very easy to use.

---

## 📂 What’s Inside?

### 📁 Main Screen
- **`settings_view.dart`**: The main page where all the settings are listed. It organizes the options into neat groups to make them easy to find.

### 📁 Small Building Blocks (Widgets)
- **`settings_section_card.dart`**: A white, rounded box that groups related settings together, giving the page a clean and organized look.
- **`settings_row.dart`**: A single row for one setting (like "Notifications"). It includes an icon, a title, and an action button (like a switch or an arrow).
- **`settings_mode_toggle.dart`**: A special, animated button used to switch between **Day Mode** (Sun) and **Night Mode** (Moon). It has a smooth sliding animation.

---

## ✨ Key Features
- **Day & Night Mode**: A beautiful toggle that lets you change the look of the app to suit your environment.
- **Easy Navigation**: Clear icons and labels help you find exactly what you need.
- **Clean Design**: We use plenty of space and rounded corners to make the settings feel modern and non-cluttered.
- **Quick Actions**: Features like "Clear Cache" or "Privacy Policy" are just one tap away.

---

## 🛠 How it's built
We have separated the code so that each part does only one job. For example, if we want to change how the "Toggle button" looks, we only need to edit one small file without touching the rest of the page. This makes the app more stable and easier to improve in the future.
