import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';

class GroupDetailScreen extends ConsumerWidget {
  final String groupId;

  const GroupDetailScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Cover image with app bar
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: const Icon(Icons.group, size: 64),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),

          // Group info
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.spacingLg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Group: $groupId',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.spacingMd,
                          vertical: AppConstants.spacingXs,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(AppConstants.radiusFull),
                        ),
                        child: const Text('Study Group'),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.spacingSm),
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
                      const Icon(Icons.people, size: 16),
                      const SizedBox(width: 4),
                      const Text('1,250 members'),
                    ],
                  ),
                  const SizedBox(height: AppConstants.spacingLg),
                  Text(
                    'A collaborative space for Computer Science students at MAK to share resources, ask questions, and help each other succeed.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppConstants.spacingLg),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Join Group'),
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacingLg),
                  const Divider(),
                  const SizedBox(height: AppConstants.spacingMd),
                  Text(
                    'Recent Posts',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),

          // Posts
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: AppConstants.spacingLg,
                    vertical: AppConstants.spacingSm,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstants.spacingLg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Text('U${index + 1}'),
                            ),
                            const SizedBox(width: AppConstants.spacingMd),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User ${index + 1}',
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  Text(
                                    '${index + 1}h ago',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppConstants.spacingMd),
                        Text(
                          'Sample group post ${index + 1}. This is a placeholder for group post content.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: AppConstants.spacingMd),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.favorite_border),
                              onPressed: () {},
                              iconSize: 20,
                            ),
                            Text('${(index + 1) * 12}'),
                            const SizedBox(width: AppConstants.spacingMd),
                            IconButton(
                              icon: const Icon(Icons.chat_bubble_outline),
                              onPressed: () {},
                              iconSize: 20,
                            ),
                            Text('${(index + 1) * 3}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 5,
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }
}
