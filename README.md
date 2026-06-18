# Taleem Plus 🎓

**Taleem Plus** is an offline-first, AI-powered Academy Management App for Android. It is designed to provide local academies with a premium, futuristic toolset for management, learning, and automation.

## 🚀 Vision
A modern EdTech platform that works seamlessly without internet, utilizing on-device AI to empower Teachers and Students while keeping Parents and Admins informed.

## ✨ Core Features

- **🛡️ Role-Based Access**: Specialized interfaces and permissions for **Admins, Teachers, Students, and Parents**.
- **🔑 Offline Authentication**: Secure login and signup using local **SQLite** storage.
- **📊 Attendance Management**: Digital tracking of daily attendance for all classes.
- **💰 Fee Ledger**: Advanced financial tracking with automatic **defaulter detection**.
- **🔍 OCR Document Scanner**: Convert physical documents to digital text using **Google ML Kit**.
- **🤖 AI Quiz Generator**: On-device, rule-based generation of tests and quizzes.
- **📝 NLP Notes Summarizer**: Automatic summarization of study notes to enhance learning efficiency.
- **☁️ Cloud Sync**: Intelligent background synchronization with **Firebase/PostgreSQL** when internet is available.

## 🛠️ Tech Stack

- **Frontend**: Flutter (Dart)
- **Local Database**: SQLite
- **Cloud Infrastructure**: Firebase
- **AI/ML**: Google ML Kit (OCR), Custom Rule-based Engines
- **State Management**: Provider / GetX

## 📁 Project Structure (Clean Architecture)

The project follows a modular clean architecture to ensure maintainability and scalability:

- **`lib/models/`**: Data blueprints and PODOs.
- **`lib/controllers/`**: Business logic and state management.
- **`lib/services/`**: Local DB operations, Cloud Sync, and ML Kit integrations.
- **`lib/views/`**: Role-specific UI modules (Admin, Teacher, Student, Parent).
- **`lib/widgets/`**: Reusable UI components.
- **`lib/utils/`**: Helpers, constants, themes, and validators.
- **`lib/config/`**: Centralized routing and app configuration.

## 🎨 Branding & Assets

- **`assets/images/logo.png`**: Procedurally generated futuristic academy logo with "TALEEM PLUS" branding.
- **`assets/images/background.png`**: Custom high-resolution teal gradient background.
- **Primary Color**: `#004D4D` (Deep Teal)
- **Accent Color**: `#00E5FF` (Cyan Glow)

## 🚀 Getting Started

### Prerequisites
- Flutter SDK: `^3.12.0`
- Android SDK with NDK support.

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/TaleemPlus-UCP/TaleemPlus-.git
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application:
   ```bash
   flutter run
   ```

## 🛠️ Build Information
To generate a release APK for Android:
```bash
flutter build apk --release
```
The output will be located at `build/app/outputs/flutter-apk/app-release.apk`.

---
Built with ❤️ by the TaleemPlus Team.
