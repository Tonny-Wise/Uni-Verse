import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/router/app_router.dart';
import '../../../data/providers/auth_provider.dart';

class ProfileScreen extends ConsumerWidget {
  final String? userId;

  const ProfileScreen({super.key, this.userId});

  bool get isOwnProfile => userId == null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            actions: isOwnProfile
                ? [
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () => context.push(AppRoutes.settings),
                    ),
                  ]
                : [
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ],
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -50),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.spacingLg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              width: 4,
                            ),
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                          child: currentUser.when(
                            data: (user) => CircleAvatar(
                              radius: 48,
                              child: Text(
                                user?.initials ?? '?',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            loading: () => const CircularProgressIndicator(),
                            error: (_, __) => const Icon(Icons.person),
                          ),
                        ),
                        const Spacer(),
                        if (isOwnProfile)
                          OutlinedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Edit profile coming soon!')),
                              );
                            },
                            child: const Text('Edit Profile'),
                          )
                        else ...[
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Follow'),
                          ),
                          const SizedBox(width: AppConstants.spacingSm),
                          OutlinedButton(
                            onPressed: () => context.push('/messages/user_$userId'),
                            child: const Text('Message'),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacingLg),

                    // Name and username
                    currentUser.when(
                      data: (user) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                isOwnProfile ? (user?.name ?? 'User') : 'User $userId',
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              if (user?.isVerified ?? false) ...[
                                const SizedBox(width: AppConstants.spacingXs),
                                Icon(
                                  Icons.verified,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 20,
                                ),
                              ],
                            ],
                          ),
                          Text(
                            '@${isOwnProfile ? (user?.username ?? 'username') : 'user_$userId'}',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
                                ),
                          ),
                        ],
                      ),
                      loading: () => const LinearProgressIndicator(),
                      error: (_, __) => const Text('Error loading profile'),
                    ),
                    const SizedBox(height: AppConstants.spacingMd),

                    // Bio
                    Text(
                      'Full-stack developer. Open source contributor. University student.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AppConstants.spacingMd),

                    // University and course
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.spacingSm,
                            vertical: AppConstants.spacingXxs,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(AppConstants.radiusSm),
                          ),
                          child: Text(
                            'MAK',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                          ),
                        ),
                        const SizedBox(width: AppConstants.spacingSm),
                        Text(
                          'Software Engineering · Year 3',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacingLg),

                    // Stats
                    Row(
                      children: [
                        _buildStat(context, '112', 'Posts'),
                        const SizedBox(width: AppConstants.spacingXl),
                        _buildStat(context, '1.5K', 'Followers'),
                        const SizedBox(width: AppConstants.spacingXl),
                        _buildStat(context, '420', 'Following'),
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacingLg),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ),

          // Posts grid
          SliverPadding(
            padding: const EdgeInsets.all(AppConstants.spacingLg),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(AppConstants.radiusMd),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image,
                        color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
                      ),
                    ),
                  );
                },
                childCount: 9,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
