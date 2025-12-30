📱 flutter_local_notification_test
A dedicated Flutter project created to test and validate local notifications behavior on Android, including:

Immediate notifications
Scheduled notifications
Notifications while the app is closed
Notifications after device reboot
Android 13+ notification permission handling
Integration tests with flutter_local_notifications
This repository serves as a clean and modern reference environment to diagnose and fix notification issues in the main application 18minutos.

🚀 Purpose
This project ensures that:
The flutter_local_notifications plugin works correctly in a clean, modern, and fully Android V2 Flutter setup.
Scheduled notifications trigger reliably, even when the app is terminated.
Android receivers and services are properly registered.
The Android environment is correctly configured (NDK, desugaring, permissions, Manifest, Gradle).

🛠️ Technologies Used
Flutter 3.x
Dart
Android Embedding V2
Kotlin
Plugin: flutter_local_notifications
Modern Gradle setup with desugaring enabled
NDK version: 27.0.12077973

📂 Project Structure
This project follows the standard Flutter structure, with important adjustments in:
android/app/src/main/AndroidManifest.xml
android/app/build.gradle.kts
MainActivity.kt
These adjustments ensure proper notification behavior on Android 12, 13, and above.

🔔 Features Tested
Basic notification display
Scheduled notifications
Execution while the app is closed
Background execution
Persistence after device reboot
Android 13+ notification permission flow

📌 Status
✔ Fully functional
✔ Notifications working reliably
✔ Serves as a reference for fixing the 18minutos app

<img width="720" height="1600" alt="image" src="https://github.com/user-attachments/assets/b915164f-93be-4dfa-b925-1f474ff51ac2" />


📄 License
Internal use for testing and validation.
Not intended for public distribution.

