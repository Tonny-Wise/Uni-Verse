import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/router/app_router.dart';
import '../../../data/providers/auth_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // Account section
          _buildSectionHeader(context, 'Account'),
          _buildSettingTile(
            context,
            icon: Icons.person_outline,
            title: 'Edit Profile',
            subtitle: 'Update your personal information',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Edit profile coming soon!')),
              );
            },
          ),
          _buildSettingTile(
            context,
            icon: Icons.email_outlined,
            title: 'Email',
            subtitle: 'user@example.com',
            onTap: () {},
          ),
          _buildSettingTile(
            context,
            icon: Icons.school_outlined,
            title: 'University',
            subtitle: 'Makerere University',
            onTap: () {},
          ),

          const Divider(),

          // Notifications section
          _buildSectionHeader(context, 'Notifications'),
          _buildSwitchTile(
            context,
            icon: Icons.notifications_outlined,
            title: 'Push Notifications',
            subtitle: 'Receive push notifications',
            value: true,
            onChanged: (value) {},
          ),
          _buildSwitchTile(
            context,
            icon: Icons.mail_outline,
            title: 'Email Notifications',
            subtitle: 'Receive email updates',
            value: false,
            onChanged: (value) {},
          ),

          const Divider(),

          // Privacy section
          _buildSectionHeader(context, 'Privacy'),
          _buildSwitchTile(
            context,
            icon: Icons.lock_outline,
            title: 'Private Profile',
            subtitle: 'Only followers can see your posts',
            value: false,
            onChanged: (value) {},
          ),
          _buildSwitchTile(
            context,
            icon: Icons.visibility_outlined,
            title: 'Online Status',
            subtitle: 'Show when you are online',
            value: true,
            onChanged: (value) {},
          ),

          const Divider(),

          // Appearance section
          _buildSectionHeader(context, 'Appearance'),
          _buildSettingTile(
            context,
            icon: Icons.dark_mode_outlined,
            title: 'Theme',
            subtitle: 'System default',
            trailing: DropdownButton<String>(
              value: 'System',
              underline: const SizedBox(),
              items: const [
                DropdownMenuItem(value: 'Light', child: Text('Light')),
                DropdownMenuItem(value: 'Dark', child: Text('Dark')),
                DropdownMenuItem(value: 'System', child: Text('System')),
              ],
              onChanged: (value) {},
            ),
            onTap: () {},
          ),

          const Divider(),

          // Other section
          _buildSectionHeader(context, 'Other'),
          _buildSettingTile(
            context,
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {},
          ),
          _buildSettingTile(
            context,
            icon: Icons.info_outline,
            title: 'About',
            subtitle: 'Version 1.0.0',
            onTap: () {},
          ),

          const Divider(),

          // Logout
          Padding(
            padding: const EdgeInsets.all(AppConstants.spacingLg),
            child: OutlinedButton.icon(
              onPressed: () async {
                final shouldLogout = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                );

                if (shouldLogout == true) {
                  await ref.read(authRepositoryProvider).signOut();
                  if (context.mounted) {
                    context.go(AppRoutes.login);
                  }
                }
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
            ),
          ),

          const SizedBox(height: AppConstants.spacingXl),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppConstants.spacingLg,
        AppConstants.spacingLg,
        AppConstants.spacingLg,
        AppConstants.spacingSm,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }

  Widget _buildSettingTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      value: value,
      onChanged: onChanged,
    );
  }
}
