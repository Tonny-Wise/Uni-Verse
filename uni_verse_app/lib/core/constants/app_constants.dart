/// App-wide constants
class AppConstants {
  AppConstants._();

  // ─── App Info ────────────────────────────────────────────────────────────
  static const String appName = 'Uni-Verse';
  static const String appTagline = 'Connect. Learn. Grow.';

  // ─── Supabase ────────────────────────────────────────────────────────────
  static const String supabaseUrl = 'https://xtnmjwxugblqybmsgztu.supabase.co';
  static const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh0bm1qd3h1Z2JscXlibXNnenR1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzIxNzIzODUsImV4cCI6MjA4Nzc0ODM4NX0.wVWYFBM_IpU9pG4jjl3WGTecMy41mII8TG7Np_mApMI';

  // ─── Agora ───────────────────────────────────────────────────────────────
  // TODO: Replace with your actual Agora credentials
  static const String agoraAppId = 'YOUR_AGORA_APP_ID';

  // ─── Spacing ─────────────────────────────────────────────────────────────
  static const double spacingXxs = 2.0;
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 12.0;
  static const double spacingLg = 16.0;
  static const double spacingXl = 24.0;
  static const double spacingXxl = 32.0;
  static const double spacing3Xl = 48.0;

  // ─── Border Radius ───────────────────────────────────────────────────────
  static const double radiusSm = 4.0;
  static const double radiusMd = 8.0;
  static const double radiusLg = 12.0;
  static const double radiusXl = 16.0;
  static const double radiusFull = 9999.0;

  // ─── Avatar Sizes ────────────────────────────────────────────────────────
  static const double avatarXs = 24.0;
  static const double avatarSm = 32.0;
  static const double avatarMd = 40.0;
  static const double avatarLg = 56.0;
  static const double avatarXl = 80.0;
  static const double avatar2Xl = 120.0;

  // ─── Icon Sizes ──────────────────────────────────────────────────────────
  static const double iconSm = 16.0;
  static const double iconMd = 20.0;
  static const double iconLg = 24.0;
  static const double iconXl = 32.0;

  // ─── Animation Durations ─────────────────────────────────────────────────
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // ─── Pagination ──────────────────────────────────────────────────────────
  static const int postsPageSize = 20;
  static const int messagesPageSize = 50;
  static const int searchPageSize = 20;

  // ─── Story Duration ──────────────────────────────────────────────────────
  static const Duration storyDuration = Duration(seconds: 5);
  static const Duration storyExpiration = Duration(hours: 24);

  // ─── Validation ──────────────────────────────────────────────────────────
  static const int minPasswordLength = 6;
  static const int maxBioLength = 150;
  static const int maxPostLength = 1000;
  static const int maxUsernameLength = 30;
  static const int minUsernameLength = 3;
}

/// Asset paths
class Assets {
  Assets._();

  // ─── Images ──────────────────────────────────────────────────────────────
  static const String logoLight = 'assets/images/logo_light.png';
  static const String logoDark = 'assets/images/logo_dark.png';
  static const String placeholder = 'assets/images/placeholder.png';
  static const String placeholderUser = 'assets/images/placeholder_user.png';

  // ─── Icons ───────────────────────────────────────────────────────────────
  static const String iconFeed = 'assets/icons/feed.svg';
  static const String iconSearch = 'assets/icons/search.svg';
  static const String iconGroups = 'assets/icons/groups.svg';
  static const String iconMessages = 'assets/icons/messages.svg';
  static const String iconProfile = 'assets/icons/profile.svg';
}

/// Storage keys for SharedPreferences
class StorageKeys {
  StorageKeys._();

  static const String themeMode = 'theme_mode';
  static const String onboardingComplete = 'onboarding_complete';
  static const String lastUniversityId = 'last_university_id';
}
