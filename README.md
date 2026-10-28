
# PawPal — The Haunted Signup Mansion 🎃🐾

**MAD 4360 — Mobile Application Development**  
**In-Class Activity 11 | Fall 2026**

## Team Members

- **Akshitha Sainath Sanagarapu** — Panther ID: 003027780
- **Mouni Sri Nallapaneni** — Panther ID: 003013851

**Track:** Graduate  
**Selected Extension:** Task C — The Guarded Crypt

## Project Overview

PawPal is a Flutter signup application that we developed further for Activity 11. We started with our existing Activity 10 signup form and reorganized it into three connected screens.

For this activity, we wanted the application to feel more interactive while keeping the original signup functionality. We chose a Halloween theme for the welcome screen, added useful features to the form, and included a personalized celebration after successful signup.

The application is a local demonstration. It validates user input but does not create or store actual user accounts.

## Features

### 1. Haunted Welcome Screen

The welcome screen introduces the PawPal Haunted Signup Mansion.

It includes:
- A purple gradient background.
- PawPal branding and Halloween-themed messages.
- An animated typewriter heading using `animated_text_kit`.
- An **Enter If You Dare** button.

The button opens the signup screen using `Navigator.push()`.

### 2. Signup Screen

The signup screen carries forward the functionality of our Activity 10 application.

It includes:
- Full-name validation.
- Email validation.
- Password validation.
- Confirm-password field.
- Password visibility toggles.
- Birth-date picker that prevents future dates.
- Local password-tip feature.
- Loading state during signup.

After a valid submission, the app navigates to the success screen.

### 3. Success Screen

After successful signup, the application displays a personalized message using the entered name.

The screen also includes:
- A PawPal welcome message.
- Confetti animation using the `confetti` package.
- A **Back to welcome** button.

The signup screen is replaced during successful navigation so users cannot accidentally return to the completed form through the normal Back action.

## Graduate Extension — Task C: The Guarded Crypt

We selected Task C because it focuses on defensive navigation and handling unexpected user actions.

The extension covers three cases:

1. **Empty-name protection:** The success screen should not display a greeting with an empty name.
2. **Double-submission protection:** Repeated taps should not create multiple success-screen navigations.
3. **Safe asynchronous navigation:** Leaving the signup screen during its loading delay should not cause an invalid state update.

### Task C Test Record

**Test 1 — Empty-name protection**

Expected: An empty name should not produce a blank personalized greeting. The user should return to the welcome screen.

Observed: Pending final hostile-case test.

**Test 2 — Double submission**

Expected: Repeated taps during loading should result in only one submission and one navigation.

Observed: Pending final hostile-case test.

**Test 3 — Leaving during loading**

Expected: Navigating away during the loading delay should not produce a state-update error or unexpected navigation.

Observed: Pending final hostile-case test.

These observations should be updated after the tests are performed.

## Project Structure

```text
lib/
├── main.dart
└── screens/
    ├── welcome_screen.dart
    ├── signup_screen.dart
    └── success_screen.dart
```

`main.dart` initializes the application and opens the welcome screen. Each screen has its own file, making the project easier to understand and allowing us to work on separate features.

## Navigation Flow

```text
WelcomeScreen
    |
    | Navigator.push()
    v
SignupScreen
    |
    | Valid submission
    | Navigator.pushReplacement()
    v
SuccessScreen
    |
    | Back to welcome
    v
WelcomeScreen
```

We used `Navigator.push()` when entering the signup screen because users should be able to return to the welcome screen.

We used `Navigator.pushReplacement()` after signup because the completed form should not remain available through normal Back navigation.

The user's name is passed to the success screen through its constructor.

## Testing

We tested the merged application using Flutter on Chrome.

### Confirmed Results

- Flutter static analysis completed with no issues.
- The haunted welcome screen opened successfully.
- The welcome button opened the signup screen.
- The signup form displayed validation errors for missing names, invalid emails, and short passwords.
- The password visibility toggle revealed the entered password.
- The birth-date picker opened successfully and disabled future dates.
- A valid signup opened the success screen.
- The success screen displayed the entered name.
- Confetti appeared on successful signup.

### Additional Tests to Complete

- Confirm-password mismatch handling.
- Two-second loading behavior.
- All three Task C hostile-case tests.
- Android installation and runtime testing.

Screenshots and further testing observations are included in the accompanying Word document.

## Team Contributions

### Akshitha Sainath Sanagarapu

- Prepared the Activity 11 repository using the existing Activity 10 project.
- Added the required animation dependencies.
- Developed the Halloween-themed animated welcome screen.
- Worked on GitHub branch management, pull requests, and integration.
- Tested the merged application and captured screenshots.
- Successfully generated the release APK.

### Mouni Sri Nallapaneni

- Developed the refactored signup screen.
- Added the form enhancements required for Activity 11.
- Developed the personalized success screen with confetti.
- Worked on the Task C defensive-navigation extension.
- Contributed changes through a separate feature branch and pull request.

Both team members contributed to the shared repository and collaborated on integrating the application.

## Technologies Used

- Flutter
- Dart
- Material Design
- `animated_text_kit`
- `confetti`
- Git and GitHub
- Visual Studio Code

## Running the Application

Make sure Flutter is installed and configured.

Clone the repository:

```bash
git clone https://github.com/AkshithaSanagarapu/MAD4360-Activity11-PawPalHauntedSignup.git
cd MAD4360-Activity11-PawPalHauntedSignup
flutter pub get
flutter run
```

To run the app in Chrome:

```bash
flutter run -d chrome
```

## Building the APK

To generate a release APK:

```bash
flutter build apk --release
```

The generated APK is located at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

Our release APK was successfully built on October 28, 2026.

## GitHub Repository

https://github.com/AkshithaSanagarapu/MAD4360-Activity11-PawPalHauntedSignup

## Conclusion

Through this activity, we reorganized our original signup application into a three-screen Flutter project and added navigation, animations, and form improvements.

Working on separate branches helped us divide responsibilities and combine our changes through pull requests. We also practiced checking validation behavior, passing data between screens, and preparing a release build.

The Task C extension gave us an opportunity to focus on what happens when users interact with the application in unexpected ways, rather than considering only the normal signup flow.