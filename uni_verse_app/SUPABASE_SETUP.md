# Uni-Verse Supabase Setup Summary

> **Project URL:** https://xtnmjwxugblqybmsgztu.supabase.co
> **Setup Date:** February 27, 2026

---

## Overview

This document summarizes the complete Supabase backend setup for the Uni-Verse social networking app for Ugandan university students.

---

## Database Schema

### Tables (22 total)

| Table | Description | RLS |
|-------|-------------|-----|
| `universities` | List of Ugandan universities | ✅ |
| `profiles` | User profiles linked to auth.users | ✅ |
| `follows` | User follow relationships | ✅ |
| `posts` | User posts (text, image, study-tip, question) | ✅ |
| `post_images` | Images attached to posts | ✅ |
| `post_likes` | Post like records | ✅ |
| `post_bookmarks` | Saved/bookmarked posts | ✅ |
| `comments` | Comments on posts | ✅ |
| `comment_likes` | Comment like records | ✅ |
| `stories` | Ephemeral stories (24h expiry) | ✅ |
| `story_slides` | Individual slides within stories | ✅ |
| `story_views` | Story view tracking | ✅ |
| `groups` | University groups/communities | ✅ |
| `group_members` | Group membership with roles | ✅ |
| `conversations` | Chat conversations (1:1 and group) | ✅ |
| `conversation_participants` | Conversation membership | ✅ |
| `messages` | Chat messages | ✅ |
| `message_reads` | Message read receipts | ✅ |
| `notifications` | User notifications | ✅ |
| `video_calls` | Video call sessions | ✅ |
| `video_call_participants` | Video call participants | ✅ |

### Seeded Data

#### Universities (10)

| Name | Short | Location |
|------|-------|----------|
| Makerere University | MAK | Kampala |
| Kyambogo University | KYU | Kampala |
| Uganda Christian University | UCU | Mukono |
| Makerere University Business School | MUBS | Kampala |
| Uganda Martyrs University | UMU | Nkozi |
| Mbarara University of Science & Technology | MUST | Mbarara |
| Gulu University | GU | Gulu |
| Busitema University | BU | Tororo |
| Ndejje University | NDU | Luwero |
| Kabale University | KAB | Kabale |

---

## Row Level Security (RLS) Policies

### Policy Summary by Table

#### Public Content (viewable by everyone)
- `universities` - SELECT
- `profiles` - SELECT
- `posts` - SELECT
- `post_images` - SELECT
- `post_likes` - SELECT
- `comments` - SELECT
- `comment_likes` - SELECT
- `follows` - SELECT
- `groups` - SELECT
- `group_members` - SELECT
- `story_slides` - SELECT

#### User-Owned Content
- `profiles` - UPDATE own profile
- `posts` - INSERT (auth), UPDATE/DELETE own
- `comments` - INSERT (auth), UPDATE/DELETE own
- `post_likes` - INSERT (auth), DELETE own
- `post_bookmarks` - SELECT/INSERT/DELETE own
- `follows` - INSERT (auth), DELETE own
- `stories` - INSERT (auth), DELETE own

#### Participant-Based Access
- `conversations` - SELECT/UPDATE by participants only
- `messages` - SELECT by conversation participants
- `video_calls` - SELECT by host or participants
- `notifications` - SELECT/UPDATE/DELETE own only

#### Role-Based Access
- `groups` - UPDATE by admins only
- `group_members` - UPDATE roles by admins only

---

## Storage Buckets

### Bucket Configuration

| Bucket | Public | Max Size | Allowed Types |
|--------|--------|----------|---------------|
| `avatars` | ✅ Yes | 5 MB | image/jpeg, image/png, image/webp, image/gif |
| `post-images` | ✅ Yes | 10 MB | image/jpeg, image/png, image/webp, image/gif |
| `story-images` | ✅ Yes | 10 MB | image/jpeg, image/png, image/webp, image/gif, video/mp4 |
| `group-covers` | ✅ Yes | 5 MB | image/jpeg, image/png, image/webp |
| `message-attachments` | 🔒 No | 20 MB | image/*, application/pdf, audio/mpeg, audio/wav |

### Storage Policies (15 total)

#### avatars
- SELECT: Public access
- INSERT: Users upload to own folder (`{user_id}/`)
- UPDATE: Users update own avatar
- DELETE: Users delete own avatar

#### post-images
- SELECT: Public access
- INSERT: Authenticated users
- DELETE: Users delete own images

#### story-images
- SELECT: Public access
- INSERT: Authenticated users
- DELETE: Users delete own images

#### group-covers
- SELECT: Public access
- INSERT: Authenticated users

#### message-attachments (Private)
- SELECT: Conversation participants only
- INSERT: Conversation participants only
- DELETE: Users delete own attachments

---

## Flutter App Configuration

### Credentials Location
`lib/core/constants/app_constants.dart`

```dart
static const String supabaseUrl = 'https://xtnmjwxugblqybmsgztu.supabase.co';
static const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
```

### Storage URL Pattern
```
https://xtnmjwxugblqybmsgztu.supabase.co/storage/v1/object/public/{bucket}/{path}
```

---

## Database Functions & Triggers

The schema includes automatic triggers for:

1. **Profile Creation** - Auto-creates profile when user signs up
2. **Follower Counts** - Updates `followers_count` and `following_count` on profiles
3. **Post Counts** - Updates `posts_count` on profiles
4. **Like Counts** - Updates `likes_count` on posts and comments
5. **Comment Counts** - Updates `comments_count` on posts
6. **Group Member Counts** - Updates `member_count` on groups
7. **Last Message Time** - Updates `last_message_at` on conversations
8. **Updated At** - Auto-updates `updated_at` timestamps

---

## API Access

### REST API
```
https://xtnmjwxugblqybmsgztu.supabase.co/rest/v1/
```

### Realtime
```
wss://xtnmjwxugblqybmsgztu.supabase.co/realtime/v1/
```

### Auth
```
https://xtnmjwxugblqybmsgztu.supabase.co/auth/v1/
```

### Storage
```
https://xtnmjwxugblqybmsgztu.supabase.co/storage/v1/
```

---

## Next Steps

1. **Enable Email Auth** - Configure in Supabase Dashboard → Authentication
2. **Add Agora Credentials** - For video calls in `app_constants.dart`
3. **Configure Email Templates** - Customize auth emails in Dashboard
4. **Set up Edge Functions** - For notifications, if needed
5. **Enable Realtime** - For messages and notifications

---

## Security Checklist

- [x] RLS enabled on all tables
- [x] Storage policies configured
- [x] Public buckets have appropriate access
- [x] Private bucket (message-attachments) restricted to participants
- [x] Users can only modify their own content
- [x] Admin roles enforced for group management
- [x] Conversation access restricted to participants

---

*Generated by Claude Code on February 27, 2026*
