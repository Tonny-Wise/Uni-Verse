import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/router/app_router.dart';

/// Main app scaffold with bottom navigation
class AppScaffold extends StatelessWidget {
  final Widget child;

  const AppScaffold({super.key, required this.child});

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/feed')) return 0;
    if (location.startsWith('/search')) return 1;
    if (location.startsWith('/groups')) return 2;
    if (location.startsWith('/messages')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRoutes.feed);
        break;
      case 1:
        context.go(AppRoutes.search);
        break;
      case 2:
        context.go(AppRoutes.groups);
        break;
      case 3:
        context.go(AppRoutes.messages);
        break;
      case 4:
        context.go(AppRoutes.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _calculateSelectedIndex(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              width: 1,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) => _onItemTapped(context, index),
          height: 64,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          backgroundColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                size: AppConstants.iconLg,
                color: selectedIndex == 0
                    ? (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                    : (isDark ? AppColors.darkMutedForeground : AppColors.lightMutedForeground),
              ),
              selectedIcon: Icon(
                Icons.home,
                size: AppConstants.iconLg,
                color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
              ),
              label: 'Feed',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.search,
                size: AppConstants.iconLg,
                color: selectedIndex == 1
                    ? (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                    : (isDark ? AppColors.darkMutedForeground : AppColors.lightMutedForeground),
              ),
              selectedIcon: Icon(
                Icons.search,
                size: AppConstants.iconLg,
                color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
              ),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.group_outlined,
                size: AppConstants.iconLg,
                color: selectedIndex == 2
                    ? (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                    : (isDark ? AppColors.darkMutedForeground : AppColors.lightMutedForeground),
              ),
              selectedIcon: Icon(
                Icons.group,
                size: AppConstants.iconLg,
                color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
              ),
              label: 'Groups',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.chat_bubble_outline,
                size: AppConstants.iconLg,
                color: selectedIndex == 3
                    ? (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                    : (isDark ? AppColors.darkMutedForeground : AppColors.lightMutedForeground),
              ),
              selectedIcon: Icon(
                Icons.chat_bubble,
                size: AppConstants.iconLg,
                color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
              ),
              label: 'Messages',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person_outline,
                size: AppConstants.iconLg,
                color: selectedIndex == 4
                    ? (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                    : (isDark ? AppColors.darkMutedForeground : AppColors.lightMutedForeground),
              ),
              selectedIcon: Icon(
                Icons.person,
                size: AppConstants.iconLg,
                color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
