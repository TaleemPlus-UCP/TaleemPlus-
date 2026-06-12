<div align="center">

<img src="https://img.shields.io/badge/Platform-Android-3DDC84?style=for-the-badge&logo=android&logoColor=white"/>
<img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
<img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white"/>
<img src="https://img.shields.io/badge/AI-On--Device-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white"/>
<img src="https://img.shields.io/badge/Offline-First-06D6A0?style=for-the-badge"/>

# TaleemPlus
### AI-Powered Academy Management App

> Offline-first · On-device AI · Role-based · Flutter · SQLite

**TaleemPlus** replaces manual paper-based workflows in small academies and tuition centers with a unified, intelligent mobile platform — no internet required, no cloud dependency.

[Features](#-features) · [Screenshots](#-screenshots) · [Tech Stack](#-tech-stack) · [Getting Started](#-getting-started) · [Architecture](#-architecture) · [Team](#-team)

---

</div>

## 📌 The Problem

Small academies across Pakistan lose hours every week to:

- Manual attendance registers prone to errors and loss
- Informal fee collection with no tracking or reminders
- 2–3 hours spent preparing each test paper by hand
- No early warning system for struggling students
- Physical record storage with high risk of data loss
- Cloud-based tools that don't work without stable internet

## 💡 The Solution

TaleemPlus automates all of it — attendance, fees, test generation, document scanning, note summarization, and performance prediction — in a single offline Android app powered by on-device AI.

---

## ✨ Features

### 🔐 Role-Based Access Control
Four distinct roles with separate dashboards and permissions:

| Role | Access |
|------|--------|
| **Admin** | Student enrollment, fee management, class setup, reports |
| **Teacher** | Attendance, test generation, OCR scanning, performance view |
| **Student** | Notes summary, test results, attendance records |
| **Parent** | Child's attendance, fee status, performance summary |

---

### 📋 Attendance Management
- Mark students as Present / Absent / Late per class session
- Auto-generates absence alerts for parents
- Filterable attendance reports by date, class, or student
- Fully stored in local SQLite — works 100% offline

---

### 💰 Fee Management
- Record, track, and filter fee payments per student
- Automatic overdue flagging with red highlights on dashboard
- **ML-powered fee delay predictor** classifies students as High / Medium / Low risk
- Proactive reminder system before dues escalate

---

### 🤖 AI Test Generator
- Teacher inputs subject, topic, and difficulty level
- Rule-based AI engine generates structured MCQ paper in under 20 seconds
- Minimum 5 questions per generation — fully editable
- Export directly to PDF for printing or sharing

---

### 📷 OCR Document Scanner
- Capture physical documents or handwritten notes via camera
- **Google ML Kit** extracts text on-device in under 4 seconds
- Supports both **English and Urdu** text recognition
- Manual correction and local save included

---

### 📝 Notes Summarizer
- Upload or type raw study text
- Offline **NLP engine (sumy)** condenses content by at least 40%
- Key concepts preserved — optimized for exam revision
- Saved summaries accessible anytime without internet

---

### 📊 Performance Predictor
- Collects attendance percentage and average test scores per student
- **TensorFlow Lite ML model** classifies each student:
  - 🟢 High Potential
  - 🟡 Steady Progress
  - 🔴 Requires Attention
- Target accuracy ≥ 75% — enables early teacher intervention

---

## 📸 Screenshots

> Frontend screens from Figma wireframes and Flutter implementation.

| Login | Attendance | Fee Tracking | AI Predictor |
|-------|------------|--------------|--------------|
| ![Login](assets/screens/login.png) | ![Attendance](assets/screens/attendance.png) | ![Fee](assets/screens/fee.png) | ![Predictor](assets/screens/predictor.png) |

---

## 🛠 Tech Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | Flutter 3.x · Dart |
| **Local Database** | SQLite via `sqflite` |
| **Session / Cache** | Hive key-value store |
| **OCR Engine** | Google ML Kit (on-device) |
| **ML Inference** | TensorFlow Lite |
| **NLP Summarizer** | sumy / transformers (offline) |
| **Authentication** | SHA-256 password hashing · RBAC |
| **Version Control** | Git · GitHub |
| **Project Management** | Trello (Kanban) · Scrum framework |

---

## 🏗 Architecture

TaleemPlus follows a clean layered architecture:

```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│   Flutter UI — Admin, Teacher,          │
│   Student, Parent Dashboards            │
├─────────────────────────────────────────┤
│         Business Logic Layer            │
│   Auth · Attendance · Fee · Test        │
│   OCR · Summarizer · Predictor          │
├─────────────────────────────────────────┤
│         AI / ML Layer (On-Device)       │
│   Google ML Kit · TensorFlow Lite       │
│   NLP Engine · Rule-Based Test Engine   │
├─────────────────────────────────────────┤
│         Data Layer                      │
│   SQLite Database · Hive Store          │
└─────────────────────────────────────────┘
         ⚡ Fully Offline — Zero Cloud
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`
- Android Studio or VS Code
- Android device / emulator running **Android 7.0 (API 24)+**

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/your-username/taleemplus.git

# 2. Navigate into the project
cd taleemplus

# 3. Install dependencies
flutter pub get

# 4. Run the app
flutter run
```

### Build APK

```bash
flutter build apk --release
```

The APK will be generated at `build/app/outputs/flutter-apk/app-release.apk`.

---

## 📁 Project Structure

```
taleemplus/
├── lib/
│   ├── main.dart
│   ├── ui/                  # Flutter screens per role
│   │   ├── admin/
│   │   ├── teacher/
│   │   ├── student/
│   │   └── parent/
│   ├── controllers/         # Business logic controllers
│   ├── models/              # Data models
│   ├── ai/                  # AI & ML engine integrations
│   │   ├── test_engine/
│   │   ├── ocr/
│   │   ├── summarizer/
│   │   └── predictor/
│   ├── database/            # SQLite helper & Hive store
│   └── utils/               # Security, session, PDF export
├── assets/
│   ├── models/              # TFLite model files
│   └── screens/             # App screenshots
├── test/                    # Unit & integration tests
├── pubspec.yaml
└── README.md
```

---

## 📦 Key Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.3.0          # SQLite local database
  hive: ^2.2.3              # Key-value session store
  hive_flutter: ^1.1.0
  google_mlkit_text_recognition: ^0.11.0   # OCR
  tflite_flutter: ^0.10.4   # On-device ML inference
  path_provider: ^2.1.1
  pdf: ^3.10.7              # PDF export
  crypto: ^3.0.3            # SHA-256 hashing
  provider: ^6.1.1          # State management
```

---

## 🔒 Security

- All passwords hashed using **SHA-256** before storage
- **Role-Based Access Control (RBAC)** enforced at every screen
- App data stored in **private, app-specific directories** — inaccessible to other apps
- Automatic session logout after idle timeout
- Atomic SQLite transactions prevent data loss on crash

---

## 📈 Non-Functional Benchmarks

| Metric | Target |
|--------|--------|
| App launch time | < 3 seconds |
| DB query response | < 500ms |
| OCR text extraction | < 4 seconds |
| AI test generation | < 20 seconds |
| ML model accuracy | ≥ 75% |
| Min Android version | Android 7.0 (API 24) |

---

## 🗂 Agile Process

This project follows the **Scrum framework** with 6 sprints over 20 weeks:

| Sprint | Goal | Story Points |
|--------|------|-------------|
| Sprint 1 | Project setup, DB schema, role-based auth | 3 pts |
| Sprint 2 | Attendance module + fee management | 10 pts |
| Sprint 3 | AI test generator + OCR scanner | 16 pts |
| Sprint 4 | Notes summarizer (offline NLP) | 8 pts |
| Sprint 5 | Performance + fee delay ML models | 16 pts |
| Sprint 6 | Parent portal, dashboards, testing | 3+ pts |

---

## 👨‍💻 Team

| Name | Role |
|------|------|
| **Muhammad Rakib Akram** | Backend · Firebase Auth · DB Schema · AI Performance Predictor · Scrum Master |
| **Khadija Irshad** | OCR Scanner · AI Test Generator · Flutter Teacher Screens |
| **Ayesha Ajmal** | AI Notes Summarizer · Flutter UI/UX · Figma Wireframes · Integration Testing |

**Product Owner:** Mam Faiza Khadim
**Institution:** University of Central Punjab — Faculty of IT & Computer Science
**Group ID:** S26CS081

---

## 📄 License

This project is developed as a **BSCS Final Year Project** at the University of Central Punjab.
All rights reserved © 2025 Group S26CS081.

---

<div align="center">

Made with ❤️ at University of Central Punjab, Lahore, Pakistan

⭐ Star this repo if you find it useful!

</div>
