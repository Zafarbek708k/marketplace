# marketplace

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)


# Movie App

**Marketplace** is a highly performant and feature-rich mobile application built using **Flutter** and **Dart**. 
This app provides a seamless user experience for browsing, discovering, and saving things with advanced capabilities like localization, theme switching, state management, and secure 
local storage.

## Features
 
- **Dynamic Theme Management**: Provides users with the option to switch between light and dark themes, ensuring a personalized experience.
- **State Management**: Powered by **Bloc**, ensuring efficient and scalable state management with fine-grained control over state changes. 
- **Secure Local Storage**: Uses **Shared Preferences** and **Flutter Secure Storage** to store user settings, preferences, and sensitive data securely.
- **Dio for API Calls**: Uses **Dio** for making robust network requests with features like interceptors, global error handling, and caching. 

## Technologies Used

- **Flutter**: A UI toolkit for building natively compiled applications for mobile.
- **Dart**: The language used to write Flutter apps, optimized for fast apps on any platform.
- **Riverpod**: State management library that ensures scalability and modular code architecture.
- **MVVM Architecture**: Ensures a clear separation of the app’s logic from the UI, making the app easier to test and maintain.
- **Localization**: Supports multiple languages using ARB files, providing a better experience for global users.
- **Shared Preferences**: Stores non-sensitive user data, such as settings and preferences.
- **Flutter Secure Storage**: Securely stores sensitive user data, such as authentication tokens and user-specific settings.
- **Dio**: A powerful HTTP client used for making efficient and customizable API requests.

## Project Structure

The project is structured following the **MVVM** pattern, which divides the app into:

- **Model**: Represents the data and business logic.
- **View**: The UI components (Flutter widgets) that display data to the user.
- **ViewModel**: Manages the state of the View and handles interactions between the View and Model.

```
lib/
│
├── generated/           # Generated files (e.g., asset generator)
├── src/                 # Main source code folder
│   ├── common/            # Core functionality
│   │   ├── constants/   # Application constants
│   │   ├── widgets/     # Reusable widgets
│   │   ├── style/       # Theme and style definitions
│   │   ├── storage/     # Local storage handling (Shared Preferences, Secure Storage)
│   │   └── server/      # Server configuration and API services (e.g., using Dio)
│   │   └── routes/      # App navigation and route definitions
│   │   └── locale/      # App language
│   │   └── utils/       # Utils
│   ├── feature/         # Feature-specific code
│   │   ├── auth/        # Authentication module
│   │   ├── cart/        # Entry module (e.g., onboarding, splash screen)
│   │   ├── chat/        # Chat screen module
│   │   ├── main/        # Main screen module
│   │   ├── payment/     # Payment screen module
│   │   ├── profile/     # Profile screen module
│   │   ├── wishlist/    # Wishlist screen module
│   │   ├── home/        # Home screen module
├── main.dart            # Main entry point of the app


```

## Installation

To install and run the Movie App on your local machine, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/Zafarbek708k/movie_app.git
   cd movie_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## API Integration

The app integrates with a third-party movie API to fetch data for movies, genres, and other related information. All network requests are handled using the **Dio** package, with a focus on error handling and API response caching for better performance.

## State Management

The app uses **Bloc** for state management, ensuring optimal performance with fine control over state and data flow throughout the app. Bloc was chosen for its flexibility and better testability compared to other state management solutions.

 

## Localization

Movie App is localized in multiple languages, including but not limited to:
- English
- Russian
- Uzbek

ARB files are used to manage translations efficiently, allowing easy expansion to additional languages in the future.

## Screenshots

![img.png](img.png)
![img_1.png](img_1.png)
![img_2.png](img_2.png)
![img_3.png](img_3.png)
![img_4.png](img_4.png)
![img_5.png](img_5.png)

## Contributing

Contributions are welcome! If you'd like to contribute to the project, please fork the repository, make your changes, and submit a pull request. Please ensure that your changes align with the project's architecture and coding standards.

 
