# Uni-Verse

A social networking platform for Ugandan university students built with Flutter.

## Overview

Uni-Verse connects students across Ugandan universities, enabling them to share updates, join study groups, message peers, and collaborate through video calls. The app features a modern, grayscale-themed UI with full dark mode support.

## Features

- **Feed & Stories** - Share posts with images, like, comment, and bookmark content. View ephemeral stories from followed users.
- **Messaging** - Real-time one-on-one and group conversations with read receipts.
- **Groups** - Join or create university-specific groups for study sessions, clubs, and events.
- **Video Calls** - Host and join video calls with screen sharing capabilities (powered by Agora).
- **Profile** - Customize your profile with university affiliation, bio, and verification badge.
- **Search** - Discover users and content across the platform.
- **Notifications** - Stay updated with likes, comments, follows, and group invites.

## Tech Stack

| Layer | Technology |
|-------|------------|
| Framework | Flutter 3.x |
| State Management | Riverpod |
| Navigation | go_router |
| Backend | Supabase (Auth, Database, Storage, Realtime) |
| Video Calls | Agora RTC |
| Data Classes | Freezed + json_serializable |

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── app.dart                  # MaterialApp configuration
├── core/
│   ├── constants/           # Colors, spacing, app constants
│   ├── router/              # go_router configuration
│   └── theme/               # Light/dark theme definitions
├── data/
│   ├── models/              # Freezed data models
│   └── providers/           # Riverpod providers
├── features/
│   ├── auth/                # Login, signup screens
│   ├── feed/                # Feed, stories, posts
│   ├── groups/              # Groups list, detail
│   ├── messages/            # Conversations, chat
│   ├── notifications/       # Notifications screen
│   ├── profile/             # User profiles
│   ├── search/              # Search functionality
│   ├── settings/            # App settings
│   └── video/               # Video calls
└── shared/
    └── widgets/             # Reusable widgets
```

## Getting Started

### Prerequisites

- Flutter SDK 3.19.0 or higher
- Dart SDK 3.3.0 or higher
- Supabase account
- Agora account (for video calls)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-org/uni-verse.git
   cd uni-verse/uni_verse_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (Freezed models)
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Set up Supabase**
   - Create a new project at [supabase.com](https://supabase.com)
   - Go to SQL Editor and run `supabase/schema.sql`
   - Run `supabase/seed_data.sql` for demo data
   - Create storage buckets:
     - `avatars`
     - `post-images`
     - `story-images`
     - `message-attachments`
     - `group-covers`

5. **Configure credentials**

   Update `lib/core/constants/app_constants.dart`:
   ```dart
   static const String supabaseUrl = 'https://your-project.supabase.co';
   static const String supabaseAnonKey = 'your-anon-key';
   static const String agoraAppId = 'your-agora-app-id';
   ```

6. **Run the app**
   ```bash
   flutter run
   ```

## Supported Universities

The app includes support for major Ugandan universities:

- Makerere University (MAK)
- Kyambogo University (KYU)
- Uganda Christian University (UCU)
- Makerere University Business School (MUBS)
- Uganda Martyrs University (UMU)
- Kampala International University (KIU)
- Mbarara University of Science and Technology (MUST)
- Gulu University (GU)
- Busitema University (BU)
- Ndejje University (NU)

## Demo Accounts

After running the seed data, you can sign in with these test accounts:

| Email | Name | University |
|-------|------|------------|
| amina@mak.ac.ug | Amina Nakato | Makerere |
| brian@kyu.ac.ug | Brian Ouma | Kyambogo |
| christine@ucu.ac.ug | Christine Apio | UCU |

*Note: You'll need to set up Supabase Auth and create actual user accounts, or modify the seed data to match your auth setup.*

## Development

### Running Tests
```bash
flutter test
```

### Building for Release
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

### Code Generation

After modifying Freezed models, regenerate:
```bash
dart run build_runner build --delete-conflicting-outputs
```

## Architecture

The app follows a feature-first architecture with clear separation of concerns:

- **Features** - Self-contained modules with screens, widgets, and feature-specific logic
- **Core** - Shared infrastructure (theme, routing, constants)
- **Data** - Models and providers that can be used across features
- **Shared** - Reusable widgets and utilities

State management uses Riverpod with:
- `StateNotifier` for complex state (auth flows)
- `StreamProvider` for real-time data (messages, notifications)
- `FutureProvider` for async data fetching

## License

This project is proprietary software by Uni-Verse, in partnership with MiAN Technologies.

## Contact

For questions or support, contact the Uni-Verse team.
