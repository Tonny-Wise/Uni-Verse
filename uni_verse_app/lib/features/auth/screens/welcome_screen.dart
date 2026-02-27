import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/router/app_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.spacingXl),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Logo and branding
              Column(
                children: [
                  // Logo
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkSecondary : AppColors.lightSecondary,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Icon(
                      Icons.school_rounded,
                      size: 56,
                      color: isDark ? AppColors.darkForeground : AppColors.lightForeground,
                    ),
                  ),

                  const SizedBox(height: AppConstants.spacingXl),

                  // App name
                  Text(
                    AppConstants.appName,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                  ),

                  const SizedBox(height: AppConstants.spacingSm),

                  // Tagline
                  Text(
                    AppConstants.appTagline,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: isDark ? AppColors.darkMutedForeground : AppColors.lightMutedForeground,
                        ),
                  ),
                ],
              ),

              const Spacer(flex: 2),

              // University logos placeholder
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.spacingLg,
                  vertical: AppConstants.spacingMd,
                ),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkSecondary : AppColors.lightSecondary,
                  borderRadius: BorderRadius.circular(AppConstants.radiusLg),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.verified_rounded,
                      size: 16,
                      color: AppColors.success,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Trusted by 10+ Ugandan Universities',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark ? AppColors.darkMutedForeground : AppColors.lightMutedForeground,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Buttons
              Column(
                children: [
                  // Sign Up button (Primary)
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => context.go(AppRoutes.signup),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark ? AppColors.darkForeground : AppColors.lightForeground,
                        foregroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppConstants.radiusLg),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppConstants.spacingMd),

                  // Sign In button (Secondary)
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton(
                      onPressed: () => context.go(AppRoutes.login),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: isDark ? AppColors.darkForeground : AppColors.lightForeground,
                        side: BorderSide(
                          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppConstants.radiusLg),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppConstants.spacingXl),

              // Terms and privacy
              Text.rich(
                TextSpan(
                  text: 'By continuing, you agree to our ',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDark ? AppColors.darkMutedForeground : AppColors.lightMutedForeground,
                      ),
                  children: [
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                        color: isDark ? AppColors.darkForeground : AppColors.lightForeground,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: isDark ? AppColors.darkForeground : AppColors.lightForeground,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppConstants.spacingLg),
            ],
          ),
        ),
      ),
    );
  }
}
