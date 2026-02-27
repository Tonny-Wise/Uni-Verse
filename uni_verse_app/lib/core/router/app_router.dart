import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/screens/splash_screen.dart';
import '../../features/auth/screens/onboarding_screen.dart';
import '../../features/auth/screens/welcome_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/signup_screen.dart';
import '../../features/feed/screens/feed_screen.dart';
import '../../features/messages/screens/conversations_screen.dart';
import '../../features/messages/screens/chat_screen.dart';
import '../../features/groups/screens/groups_screen.dart';
import '../../features/groups/screens/group_detail_screen.dart';
import '../../features/search/screens/search_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/notifications/screens/notifications_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/video/screens/video_calls_screen.dart';
import '../../features/video/screens/video_call_screen.dart';
import '../../shared/widgets/app_scaffold.dart';
import '../../data/providers/auth_provider.dart';

// Route names
class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String feed = '/feed';
  static const String search = '/search';
  static const String messages = '/messages';
  static const String chat = '/messages/:chatId';
  static const String groups = '/groups';
  static const String groupDetail = '/groups/:groupId';
  static const String video = '/video';
  static const String videoCall = '/video/:callId';
  static const String profile = '/profile';
  static const String userProfile = '/profile/:userId';
  static const String notifications = '/notifications';
  static const String settings = '/settings';
}

// Navigation keys for bottom nav
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

// Router provider
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull != null;
      final currentPath = state.matchedLocation;

      // Allow splash, onboarding, and welcome without auth
      final publicRoutes = [
        AppRoutes.splash,
        AppRoutes.onboarding,
        AppRoutes.welcome,
        AppRoutes.login,
        AppRoutes.signup,
      ];

      final isPublicRoute = publicRoutes.contains(currentPath);

      // If on splash, let it handle its own navigation
      if (currentPath == AppRoutes.splash) {
        return null;
      }

      // Redirect to feed if already authenticated and on auth/welcome routes
      if (isLoggedIn && isPublicRoute && currentPath != AppRoutes.splash) {
        return AppRoutes.feed;
      }

      // Redirect to welcome if not authenticated and trying to access protected route
      if (!isLoggedIn && !isPublicRoute) {
        return AppRoutes.welcome;
      }

      return null;
    },
    routes: [
      // Splash screen (initial route)
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // Onboarding (first-time users)
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),

      // Welcome screen (login/signup choice)
      GoRoute(
        path: AppRoutes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),

      // Login
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),

      // Signup
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignupScreen(),
      ),

      // Main app shell with bottom navigation
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => AppScaffold(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.feed,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: FeedScreen(),
            ),
          ),
          GoRoute(
            path: AppRoutes.search,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SearchScreen(),
            ),
          ),
          GoRoute(
            path: AppRoutes.groups,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: GroupsScreen(),
            ),
            routes: [
              GoRoute(
                path: ':groupId',
                builder: (context, state) => GroupDetailScreen(
                  groupId: state.pathParameters['groupId']!,
                ),
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.messages,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ConversationsScreen(),
            ),
            routes: [
              GoRoute(
                path: ':chatId',
                builder: (context, state) => ChatScreen(
                  chatId: state.pathParameters['chatId']!,
                ),
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.profile,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
            routes: [
              GoRoute(
                path: ':userId',
                builder: (context, state) => ProfileScreen(
                  userId: state.pathParameters['userId'],
                ),
              ),
            ],
          ),
        ],
      ),

      // Full-screen routes (outside shell)
      GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.video,
        builder: (context, state) => const VideoCallsScreen(),
        routes: [
          GoRoute(
            path: ':callId',
            builder: (context, state) => VideoCallScreen(
              callId: state.pathParameters['callId']!,
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(state.error?.message ?? 'Unknown error'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.feed),
              child: const Text('Go to Feed'),
            ),
          ],
        ),
      ),
    ),
  );
});
