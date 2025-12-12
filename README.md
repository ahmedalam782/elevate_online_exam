# Elevate Online Exam 📝

A comprehensive Flutter-based online examination platform that enables users to take exams, view scores, and manage their profiles. Built with modern Flutter architecture using BLoC pattern, clean architecture principles, and dependency injection.

## ✨ Features

- **User Authentication**
  - Login and signup functionality
  - Secure password storage with Flutter Secure Storage
  - Forget password and change password features
  - OTP verification with Pinput

- **Exam Management**
  - Browse available exams
  - Start and take exams with timer
  - Multiple choice questions interface
  - Real-time exam progress tracking
  - View exam scores and results
  - Detailed answer review

- **User Profile**
  - Profile management
  - Avatar upload with image cropper
  - User information display and editing

- **Exploration**
  - Discover and explore available exams
  - Search functionality

- **Localization**
  - Multi-language support (English & Arabic)
  - RTL (Right-to-Left) support for Arabic
  - Custom fonts for each language

- **Responsive Design**
  - Adaptive UI for mobile, tablet, and web
  - Screen size adaptation using ScreenUtil
  - Platform-specific themes (Material & Cupertino)

## 🛠 Tech Stack

### Core
- **Flutter SDK** ^3.9.2
- **Dart** - Programming language

### State Management & Architecture
- **flutter_bloc** ^9.1.1 - BLoC pattern for state management
- **get_it** ^9.1.1 - Service locator for dependency injection
- **injectable** ^2.7.0 - Code generator for dependency injection
- **equatable** ^2.0.7 - Value equality

### Navigation
- **go_router** ^17.0.0 - Declarative routing

### Networking
- **dio** ^5.9.0 - HTTP client
- **retrofit** ^4.9.1 - Type-safe REST client
- **pretty_dio_logger** ^1.4.0 - Network request logging
- **internet_connection_checker_plus** ^2.9.1 - Network connectivity

### Local Storage
- **hive** ^2.2.3 - Lightweight key-value database
- **flutter_secure_storage** ^9.2.4 - Secure storage for sensitive data
- **shared_preferences** ^2.5.3 - Simple persistent storage
- **path_provider** ^2.1.5 - File system paths

### UI Components
- **flutter_screenutil** ^5.9.3 - Screen adaptation
- **cached_network_image** ^3.4.1 - Image caching
- **flutter_svg** ^2.2.3 - SVG rendering
- **lottie** ^3.3.2 - Animations
- **shimmer** ^3.0.0 - Loading effects
- **toastification** ^3.0.3 - Toast notifications
- **modal_progress_hud_nsn** ^0.5.1 - Loading indicators
- **pinput** ^6.0.1 - OTP input widget

### Utilities
- **easy_localization** ^3.0.8 - Internationalization
- **image_picker** ^1.2.1 - Pick images from gallery/camera
- **image_cropper** ^11.0.0 - Crop images
- **logger** ^2.6.2 - Logging
- **json_annotation** ^4.9.0 - JSON serialization

### Dev Dependencies
- **build_runner** ^2.10.0 - Code generation
- **injectable_generator** ^2.9.0 - DI code generation
- **json_serializable** ^6.11.1 - JSON serialization
- **retrofit_generator** ^10.0.6 - Retrofit code generation
- **flutter_launcher_icons** ^0.13.1 - App icon generation
- **flutter_lints** ^6.0.0 - Linting rules
- **mockito** ^5.5.1 - Testing framework

## 📋 Prerequisites

Before you begin, ensure you have the following installed:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.9.2 or higher)
- [Dart SDK](https://dart.dev/get-dart) (comes with Flutter)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- [Xcode](https://developer.apple.com/xcode/) (for iOS development on macOS)
- A device or emulator for testing

## 🚀 Getting Started

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/ahmedalam782/elevate_online_exam.git
   cd elevate_online_exam
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   # For development
   flutter run
   
   # For specific platform
   flutter run -d chrome        # Web
   flutter run -d android       # Android
   flutter run -d ios           # iOS
   flutter run -d windows       # Windows
   flutter run -d macos         # macOS
   flutter run -d linux         # Linux
   ```

### Build for Production

```bash
# Android
flutter build apk --release
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# Desktop
flutter build windows --release
flutter build macos --release
flutter build linux --release
```

## 📁 Project Structure

```
lib/
├── app.dart                      # Main app widget
├── main.dart                     # App entry point
├── core/                         # Core functionality
│   ├── config/                   # Configuration
│   │   ├── api/                  # API configuration
│   │   ├── di/                   # Dependency injection
│   │   ├── base_state/           # Base state management
│   │   └── local/                # Local storage config
│   ├── errors/                   # Error handling
│   ├── helper/                   # Helper utilities
│   ├── languages/                # Localization
│   ├── routes/                   # Navigation & routing
│   ├── theme/                    # Theme & styling
│   ├── utils/                    # Utility classes
│   └── validations/              # Form validations
└── features/                     # Feature modules
    ├── splash/                   # Splash screen
    ├── login/                    # Login feature
    ├── signup/                   # Registration
    ├── forget_password/          # Password recovery
    ├── change_password/          # Change password
    ├── app_layout/               # Main app layout
    ├── explore/                  # Explore exams
    ├── exams_tap/                # Exams list
    ├── questions/                # Exam questions
    ├── answers/                  # Answer review
    ├── exam_score/               # Score display
    ├── result/                   # Results page
    └── profile/                  # User profile
```

Each feature follows clean architecture with:
- `data/` - Data sources, models, repositories
- `domain/` - Business logic, entities, use cases
- `presentation/` - UI, BLoC, widgets

## 🌍 Localization

The app supports multiple languages:
- English (en-US)
- Arabic (ar-EG)

Translation files are located in `assets/localization/`.

To add a new language:
1. Create a new JSON file in `assets/localization/` (e.g., `fr-FR.json`)
2. Add translations following the existing structure
3. Update `lib/core/languages/lang.dart` to include the new locale

## 🎨 Assets

- **Images**: `assets/images/`
- **Icons**: `assets/icons/`
- **Animations**: `assets/animations/`
- **Fonts**: `assets/fonts/`
  - English: Roboto (Light, Regular, Medium, SemiBold, Bold)
  - Arabic: Roboto (Light, Regular, Medium, SemiBold, Bold)

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## 🔧 Development

### Code Generation

When you modify models or add new injectable dependencies:

```bash
# Watch for changes and rebuild automatically
flutter pub run build_runner watch

# One-time build
flutter pub run build_runner build --delete-conflicting-outputs
```

### Linting

```bash
flutter analyze
```

### Format Code

```bash
flutter format .
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Commit your changes (`git commit -m 'Add some amazing feature'`)
5. Push to the branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request

Please ensure your code:
- Follows the existing code style
- Includes appropriate tests
- Has proper documentation
- Passes all linting checks

## 📄 License

This project is private and not published to pub.dev.

## 👤 Author

**Ahmed Alam**
- GitHub: [@ahmedalam782](https://github.com/ahmedalam782)

## 📞 Support

For support, please open an issue in the GitHub repository.

---

Made with ❤️ using Flutter
