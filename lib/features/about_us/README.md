# 📘 About Us Feature - Overview

This section of the app is designed to show users information about the development team, how to contact us, and how to support the app. We have organized the code into small, clear pieces to make it easy to manage and update.

---

## 📂 What’s Inside?

### 📁 Logic & Data (The "Brain")
- **`about_us_cubit.dart`**: This is the manager of the page. It decides when to show the loading screen, when to show the actual info, and what to do if the internet is disconnected.
- **`about_us_state.dart`**: These are the "moods" of the page (e.g., "I'm busy loading," "I'm ready," or "Something went wrong").
- **`about_us_model.dart`**: This is a simple template that defines what information we need (like company name, email, and phone number).
- **`about_us_repository.dart`**: This is the "messenger" that goes to our database to bring back the latest contact information.

### 📁 Visuals (The "Face")
- **`about_us_view.dart`**: The main container that holds everything together on the screen.
- **`about_developer_card.dart`**: The top box showing the developer's name, specialty, and social media links.
- **`about_info_tile.dart`**: A single row of information, like an email address or a website link, with an icon next to it.
- **`about_section_card.dart`**: A clean, rounded box that groups related links together (like the "Contact Us" group).
- **`about_section_label.dart`**: The title for each group, like "Contact Info" or "Support."
- **`about_social_chip.dart`**: The small, clickable buttons for Facebook, Twitter (X), and LinkedIn.
- **`about_us_shimmer.dart`**: A smooth, "ghost-like" animation that shows while the app is waiting for the data to arrive.
- **`about_us_error_widget.dart`**: A friendly screen that appears if the data fails to load (usually because of no internet), with a "Try Again" button.
- **`about_us_body.dart`**: The main list that allows you to scroll through all the information.

---

## ✨ Key Features
- **Simple & Fast**: The page loads quickly and shows a nice animation while waiting.
- **Always Updated**: We can change the contact info on our server, and it will update in your app instantly without needing a new update from the store.
- **Friendly Errors**: If you are offline, the app clearly tells you and lets you refresh with one click.
- **Professional Look**: We use the app's official colors and fonts to keep everything looking beautiful and consistent.
