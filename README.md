# Consultant Marketplace App

A Flutter app that connects customers with consultants. Customers browse consultants by category, follow them, track their consultations and top up an in-app wallet. Consultants set their expertise, session prices and weekly availability. The app supports English and Arabic, including right-to-left layouts.

> **Status:** work in progress. The UI flows below are built and run on mock data; the backend integration is the next step.

<!--
Screenshots: add 4 to 6 phone screenshots (onboarding, home, consultant profile,
wallet, notifications, Arabic RTL screen), for example:
<p float="left">
  <img src="screenshots/onboarding.png" width="200" />
  <img src="screenshots/home.png" width="200" />
  <img src="screenshots/wallet.png" width="200" />
  <img src="screenshots/home_ar.png" width="200" />
</p>
-->

## Features

**Onboarding and sign-up**
- Onboarding carousel driven by a Riverpod notifier
- Sign-up method selection, email sign-in, and phone sign-up with a country code picker and OTP screen with resend timer
- Role selection (customer or consultant), personal information and interest selection

**Customer side**
- Home with promotional banners, categories, recommended consultants and a "following" tab
- Category browsing and search with recent searches
- My consultations, messages and profile screens
- Wallet with an add-funds flow
- Notifications screen with "All" and "Payments" tabs

**Consultant side**
- Expertise setup: categories, separate prices for chat, audio call and video call sessions, and a weekly availability schedule with per-day toggles

**Localization**
- English and Arabic with Flutter's `gen-l10n` (ARB files); layouts switch to right-to-left automatically in Arabic

## Tech stack

| Area | Tools |
|---|---|
| UI | Flutter, flutter_svg, cached_network_image, dotted_border |
| State management | flutter_riverpod |
| Dependency injection | get_it |
| Functional error handling | dartz (`Either<Failure, T>`) |
| Localization | flutter_localizations, intl, ARB files |
| Connectivity | internet_connection_checker |

## Architecture

The project follows Clean Architecture, organized by feature:

```
lib/
├── config/
│   ├── injection/      # get_it service locator
│   ├── routes/         # named routes and onGenerateRoute
│   └── theme/          # colors, typography, spacing, app theme
├── core/
│   ├── l10n/           # ARB files and generated localizations
│   ├── errors/         # exceptions and failures
│   ├── use_cases/      # base use case
│   ├── shared/widgets/ # buttons, text fields, app bar, tab bar, wallet, rating
│   └── common/         # models and mock data
└── features/
    ├── auth/           # data / domain / presentation for onboarding, sign-up and OTP
    ├── user_category_selection/
    ├── personal_information/
    ├── customer/       # home, categories, search, consultations, messages, wallet, profile
    ├── consultant/     # expertise and availability setup
    └── notification/
```

The auth feature shows the full layering: local data source → repository implementation → repository contract → use cases → Riverpod providers → screens.

## Getting started

```sh
git clone https://github.com/mosabmoammar/consultant_customer_app.git
cd consultant_customer_app
flutter pub get
flutter gen-l10n
flutter run
```
