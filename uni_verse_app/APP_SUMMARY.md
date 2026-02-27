# Uni-Verse App - Comprehensive Summary

## Executive Overview

Uni-Verse is a mobile social networking platform designed specifically for Ugandan university students. The application facilitates academic collaboration, social interaction, and community building across 10+ universities in Uganda. Built with Flutter for cross-platform deployment (iOS & Android), the app leverages Supabase for backend services and Agora for real-time video communication.

---

## Target Audience

- **Primary Users**: University students in Uganda
- **Age Range**: 18-30 years old
- **Use Cases**:
  - Academic collaboration and study groups
  - Social networking with peers
  - University-specific community engagement
  - Real-time communication via messaging and video calls

---

## Feature Breakdown

### 1. Authentication System

| Feature | Description |
|---------|-------------|
| Email/Password Login | Standard authentication with Supabase Auth |
| University Selection | Users select their university during signup |
| Profile Creation | Name, username, course, year of study |
| Session Management | Persistent login with secure token storage |

**Screens**: `login_screen.dart`, `signup_screen.dart`

### 2. Feed & Stories

| Feature | Description |
|---------|-------------|
| Post Creation | Text posts with optional image attachments |
| Stories | 24-hour ephemeral content (images/text) |
| Interactions | Like, comment, bookmark, share |
| Feed Algorithm | Chronological feed from followed users |

**Data Models**:
- `Post` - id, authorId, content, images, likesCount, commentsCount, createdAt
- `Story` - id, userId, slides[], expiresAt
- `StorySlide` - imageUrl, caption, backgroundColor

**Screens**: `feed_screen.dart`

### 3. Messaging System

| Feature | Description |
|---------|-------------|
| Direct Messages | One-on-one private conversations |
| Group Chats | Multi-user conversations |
| Read Receipts | Track message delivery and read status |
| Media Sharing | Send images and attachments |
| Real-time Updates | Live message delivery via Supabase Realtime |

**Data Models**:
- `Conversation` - id, type (direct/group), participants[], lastMessage, unreadCount
- `Message` - id, conversationId, senderId, content, type (text/image/file), createdAt
- `ConversationParticipant` - conversationId, userId, joinedAt, lastReadAt

**Screens**: `conversations_screen.dart`, `chat_screen.dart`

### 4. Groups

| Feature | Description |
|---------|-------------|
| Group Discovery | Browse and search public groups |
| Category Filtering | Academic, Social, Sports, Career, etc. |
| Membership | Join/leave groups, member management |
| Group Posts | Shared content within group context |
| Roles | Owner, Admin, Member permission levels |

**Data Models**:
- `Group` - id, name, description, category, coverImageUrl, memberCount, isPublic
- `GroupMember` - groupId, userId, role, joinedAt

**Screens**: `groups_screen.dart`, `group_detail_screen.dart`

### 5. Video Calls

| Feature | Description |
|---------|-------------|
| Video Conferencing | Multi-participant video calls via Agora |
| Screen Sharing | Share screen during calls |
| Call Controls | Mute, camera toggle, end call |
| Call Scheduling | Schedule future video sessions |
| Call History | View past and upcoming calls |

**Data Models**:
- `VideoCall` - id, title, hostId, status (scheduled/live/ended), scheduledAt, channelName
- `CallParticipant` - callId, userId, joinedAt, leftAt

**Screens**: `video_calls_screen.dart`, `video_call_screen.dart`

### 6. User Profiles

| Feature | Description |
|---------|-------------|
| Profile Display | Avatar, name, bio, university badge |
| Statistics | Posts count, followers, following |
| Verification | Blue checkmark for verified accounts |
| Posts Grid | Gallery view of user's posts |
| Follow/Unfollow | Social connection management |

**Data Models**:
- `UserProfile` - id, name, username, email, avatarUrl, bio, universityId, course, yearOfStudy, isVerified, followersCount, followingCount

**Screens**: `profile_screen.dart`

### 7. Search

| Feature | Description |
|---------|-------------|
| User Search | Find users by name or username |
| Post Search | Search post content |
| Filters | Filter by university, category |
| Recent Searches | Quick access to search history |

**Screens**: `search_screen.dart`

### 8. Notifications

| Feature | Description |
|---------|-------------|
| Like Notifications | When someone likes your post/comment |
| Comment Notifications | New comments on your posts |
| Follow Notifications | New followers |
| Mention Notifications | When tagged in posts |
| Group Invites | Invitations to join groups |
| Tabbed View | All, Unread, Mentions filters |

**Data Models**:
- `AppNotification` - id, userId, type, actorId, targetType, targetId, content, isRead, createdAt

**Screens**: `notifications_screen.dart`

### 9. Settings

| Feature | Description |
|---------|-------------|
| Account Settings | Edit profile, email, university |
| Notifications | Push and email notification preferences |
| Privacy | Profile visibility, online status |
| Appearance | Theme selection (Light/Dark/System) |
| Help & Support | FAQ, contact support |
| Logout | Secure session termination |

**Screens**: `settings_screen.dart`

---

## Technical Architecture

### State Management (Riverpod)

```
┌─────────────────────────────────────────────────────────┐
│                      UI Layer                            │
│  (ConsumerWidget, ConsumerStatefulWidget)               │
└─────────────────────┬───────────────────────────────────┘
                      │ ref.watch / ref.read
┌─────────────────────▼───────────────────────────────────┐
│                  Provider Layer                          │
│  StateNotifierProvider, StreamProvider, FutureProvider  │
└─────────────────────┬───────────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────────┐
│                 Repository Layer                         │
│  AuthRepository, PostRepository, MessageRepository      │
└─────────────────────┬───────────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────────┐
│                  Supabase Client                         │
│  Auth, Database (PostgreSQL), Storage, Realtime         │
└─────────────────────────────────────────────────────────┘
```

### Navigation (go_router)

```
/
├── /login                    # Unauthenticated
├── /signup                   # Unauthenticated
│
└── / (ShellRoute with NavigationBar)  # Authenticated
    ├── /feed                 # Main feed
    ├── /search               # Search users/posts
    ├── /groups               # Groups list
    │   └── /groups/:id       # Group detail
    ├── /messages             # Conversations
    │   └── /messages/:id     # Chat screen
    └── /profile              # Own profile
        └── /profile/:id      # Other user profile

├── /notifications            # Notifications
├── /settings                 # Settings
├── /video                    # Video calls list
│   └── /video/:id            # Active call
```

### Database Schema

**Core Tables**:
| Table | Description | Key Relations |
|-------|-------------|---------------|
| universities | Institution registry | - |
| profiles | User profiles | → universities |
| follows | User relationships | → profiles (2x) |
| posts | User content | → profiles |
| post_images | Post attachments | → posts |
| post_likes | Like records | → posts, profiles |
| post_bookmarks | Saved posts | → posts, profiles |
| comments | Post comments | → posts, profiles |
| stories | Ephemeral content | → profiles |
| story_slides | Story content | → stories |
| conversations | Chat threads | - |
| conversation_participants | Chat members | → conversations, profiles |
| messages | Chat messages | → conversations, profiles |
| groups | Community groups | → universities |
| group_members | Group membership | → groups, profiles |
| video_calls | Call sessions | → profiles |
| video_call_participants | Call attendees | → video_calls, profiles |
| notifications | User notifications | → profiles |

**Row Level Security (RLS)**:
- All tables have RLS enabled
- Users can only read/write their own data
- Public content (posts, profiles) readable by authenticated users
- Messages only visible to conversation participants
- Group content visible to group members

### Data Models (Freezed)

All models use Freezed for:
- Immutable data classes
- JSON serialization/deserialization
- copyWith functionality
- Equality comparison

```dart
@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String name,
    required String username,
    // ... other fields
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
```

---

## File Structure

```
uni_verse_app/
├── lib/
│   ├── main.dart                          # Entry point
│   ├── app.dart                           # App configuration
│   │
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_colors.dart            # Color definitions
│   │   │   └── app_constants.dart         # Spacing, sizing, API keys
│   │   ├── router/
│   │   │   └── app_router.dart            # Navigation configuration
│   │   └── theme/
│   │       └── app_theme.dart             # Theme definitions
│   │
│   ├── data/
│   │   ├── models/
│   │   │   ├── university.dart
│   │   │   ├── user_profile.dart
│   │   │   ├── post.dart
│   │   │   ├── comment.dart
│   │   │   ├── story.dart
│   │   │   ├── conversation.dart
│   │   │   ├── message.dart
│   │   │   ├── group.dart
│   │   │   ├── video_call.dart
│   │   │   ├── app_notification.dart
│   │   │   └── models.dart                # Barrel export
│   │   └── providers/
│   │       └── auth_provider.dart         # Auth state management
│   │
│   ├── features/
│   │   ├── auth/
│   │   │   └── screens/
│   │   │       ├── login_screen.dart
│   │   │       └── signup_screen.dart
│   │   ├── feed/
│   │   │   └── screens/
│   │   │       └── feed_screen.dart
│   │   ├── groups/
│   │   │   └── screens/
│   │   │       ├── groups_screen.dart
│   │   │       └── group_detail_screen.dart
│   │   ├── messages/
│   │   │   └── screens/
│   │   │       ├── conversations_screen.dart
│   │   │       └── chat_screen.dart
│   │   ├── notifications/
│   │   │   └── screens/
│   │   │       └── notifications_screen.dart
│   │   ├── profile/
│   │   │   └── screens/
│   │   │       └── profile_screen.dart
│   │   ├── search/
│   │   │   └── screens/
│   │   │       └── search_screen.dart
│   │   ├── settings/
│   │   │   └── screens/
│   │   │       └── settings_screen.dart
│   │   └── video/
│   │       └── screens/
│   │           ├── video_calls_screen.dart
│   │           └── video_call_screen.dart
│   │
│   └── shared/
│       └── widgets/
│           └── app_scaffold.dart          # Main navigation scaffold
│
├── supabase/
│   ├── schema.sql                         # Database schema
│   └── seed_data.sql                      # Demo data
│
├── test/
│   └── widget_test.dart                   # Basic widget tests
│
├── pubspec.yaml                           # Dependencies
├── README.md                              # Setup guide
└── APP_SUMMARY.md                         # This document
```

---

## Dependencies

### Core Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| flutter_riverpod | ^2.4.9 | State management |
| go_router | ^13.2.0 | Navigation |
| supabase_flutter | ^2.3.0 | Backend services |
| freezed_annotation | ^2.4.1 | Data classes |
| json_annotation | ^4.8.1 | JSON serialization |

### UI Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| cached_network_image | ^3.3.1 | Image caching |
| flutter_svg | ^2.0.9 | SVG rendering |
| shimmer | ^3.0.0 | Loading skeletons |
| flutter_staggered_grid_view | ^0.7.0 | Grid layouts |

### Feature Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| agora_rtc_engine | ^6.3.0 | Video calls |
| image_picker | ^1.0.7 | Media selection |
| permission_handler | ^11.2.0 | Permission management |
| share_plus | ^7.2.1 | Content sharing |
| url_launcher | ^6.2.4 | External links |

### Dev Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| build_runner | ^2.4.8 | Code generation |
| freezed | ^2.4.6 | Code generation |
| json_serializable | ^6.7.1 | JSON code generation |

---

## Design System

### Color Palette

**Light Theme**:
| Color | Hex | Usage |
|-------|-----|-------|
| Background | #FFFFFF | Main background |
| Foreground | #09090B | Primary text |
| Card | #FFFFFF | Card backgrounds |
| Primary | #18181B | Buttons, accents |
| Muted | #F4F4F5 | Secondary backgrounds |
| Border | #E4E4E7 | Dividers, outlines |

**Dark Theme**:
| Color | Hex | Usage |
|-------|-----|-------|
| Background | #09090B | Main background |
| Foreground | #FAFAFA | Primary text |
| Card | #09090B | Card backgrounds |
| Primary | #FAFAFA | Buttons, accents |
| Muted | #27272A | Secondary backgrounds |
| Border | #27272A | Dividers, outlines |

### Spacing Scale

| Name | Value | Usage |
|------|-------|-------|
| xxs | 2px | Minimal gaps |
| xs | 4px | Tight spacing |
| sm | 8px | Small gaps |
| md | 12px | Medium gaps |
| lg | 16px | Standard padding |
| xl | 24px | Large sections |
| xxl | 32px | Major sections |

### Typography

Based on Material Design 3 with custom styling:
- Headlines: Bold weight
- Body: Regular weight
- Labels: Medium weight
- All using system fonts for performance

---

## Security Considerations

1. **Authentication**: Supabase Auth with JWT tokens
2. **Data Access**: Row Level Security on all tables
3. **API Keys**: Stored in constants file (should use env variables in production)
4. **Input Validation**: Form validation on all user inputs
5. **Secure Storage**: flutter_secure_storage for sensitive data

---

## Performance Optimizations

1. **Image Caching**: cached_network_image for efficient image loading
2. **Lazy Loading**: Pagination on feeds and lists
3. **Code Generation**: Freezed models avoid runtime reflection
4. **Widget Optimization**: const constructors where possible
5. **State Management**: Riverpod's selective rebuilds

---

## Future Enhancements

1. **Push Notifications**: Firebase Cloud Messaging integration
2. **Offline Support**: Local caching with Hive/Isar
3. **Media Optimization**: Image compression before upload
4. **Analytics**: User behavior tracking
5. **Localization**: Multi-language support
6. **Accessibility**: Screen reader optimization
7. **Deep Linking**: Universal links for content sharing

---

## Deployment Checklist

### Pre-Release
- [ ] Replace placeholder API keys
- [ ] Set up production Supabase project
- [ ] Configure Agora production credentials
- [ ] Run full test suite
- [ ] Performance testing

### Android
- [ ] Configure signing keys
- [ ] Update package name
- [ ] Prepare Play Store assets
- [ ] Create Play Store listing

### iOS
- [ ] Configure provisioning profiles
- [ ] Update bundle identifier
- [ ] Prepare App Store assets
- [ ] Create App Store Connect listing

---

## Support & Maintenance

**Version**: 1.0.0
**Last Updated**: February 2025
**Developed By**: Uni-Verse, in partnership with MiAN Technologies

For technical support or feature requests, contact the Uni-Verse team.
