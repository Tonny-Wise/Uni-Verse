import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/router/app_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      icon: Icons.people_rounded,
      iconColor: AppColors.info,
      title: 'Connect',
      subtitle: 'With Your Campus Community',
      description:
          'Join thousands of students from universities across Uganda. Build meaningful connections with classmates, alumni, and students from other institutions.',
    ),
    OnboardingPage(
      icon: Icons.school_rounded,
      iconColor: AppColors.success,
      title: 'Learn',
      subtitle: 'Together, Grow Together',
      description:
          'Share study tips, ask questions, and collaborate in course-specific groups. Access resources and insights from students who\'ve been there.',
    ),
    OnboardingPage(
      icon: Icons.trending_up_rounded,
      iconColor: AppColors.warning,
      title: 'Grow',
      subtitle: 'Your Academic Journey',
      description:
          'Stay updated with campus events, join video study sessions, and be part of a supportive community that helps you succeed.',
    ),
  ];

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: AppConstants.animationNormal,
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _skipOnboarding() {
    _completeOnboarding();
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(StorageKeys.onboardingComplete, true);

    if (mounted) {
      context.go(AppRoutes.welcome);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isLastPage = _currentPage == _pages.length - 1;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spacingLg),
                child: TextButton(
                  onPressed: _skipOnboarding,
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: isDark ? AppColors.darkMutedForeground : AppColors.lightMutedForeground,
                    ),
                  ),
                ),
              ),
            ),

            // Page view
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _buildPage(_pages[index], isDark);
                },
              ),
            ),

            // Bottom section
            Padding(
              padding: const EdgeInsets.all(AppConstants.spacingXl),
              child: Column(
                children: [
                  // Page indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => AnimatedContainer(
                        duration: AppConstants.animationFast,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: _currentPage == index
                              ? (isDark ? AppColors.darkForeground : AppColors.lightForeground)
                              : (isDark ? AppColors.darkMuted : AppColors.lightMuted),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppConstants.spacingXl),

                  // Continue/Get Started button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark ? AppColors.darkForeground : AppColors.lightForeground,
                        foregroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppConstants.radiusLg),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isLastPage ? 'Get Started' : 'Continue',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            isLastPage ? Icons.arrow_forward_rounded : Icons.arrow_forward_rounded,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPage page, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.spacingXl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon container
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: page.iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Icon(
              page.icon,
              size: 72,
              color: page.iconColor,
            ),
          ),

          const SizedBox(height: AppConstants.spacing3Xl),

          // Title
          Text(
            page.title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
          ),

          const SizedBox(height: AppConstants.spacingSm),

          // Subtitle
          Text(
            page.subtitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: page.iconColor,
                  fontWeight: FontWeight.w500,
                ),
          ),

          const SizedBox(height: AppConstants.spacingXl),

          // Description
          Text(
            page.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isDark ? AppColors.darkMutedForeground : AppColors.lightMutedForeground,
                  height: 1.6,
                ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String description;

  const OnboardingPage({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.description,
  });
}
