import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/router/app_router.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.appName,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => context.push(AppRoutes.notifications),
          ),
          IconButton(
            icon: const Icon(Icons.videocam_outlined),
            onPressed: () => context.push(AppRoutes.video),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.spacingLg),
        children: [
          // Stories placeholder
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  width: 72,
                  margin: const EdgeInsets.only(right: AppConstants.spacingSm),
                  child: Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).colorScheme.primary,
                              Theme.of(context).colorScheme.secondary,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            child: index == 0
                                ? const Icon(Icons.add)
                                : Text('U${index}'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        index == 0 ? 'Your Story' : 'User $index',
                        style: Theme.of(context).textTheme.labelSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const Divider(),

          // Posts placeholder
          ...List.generate(
            5,
            (index) => Card(
              margin: const EdgeInsets.only(bottom: AppConstants.spacingLg),
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spacingLg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Post header
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
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_horiz),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: AppConstants.spacingMd),

                    // Post content
                    Text(
                      'This is a sample post #${index + 1}. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    const SizedBox(height: AppConstants.spacingMd),

                    // Post actions
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {},
                        ),
                        Text('${(index + 1) * 23}'),
                        const SizedBox(width: AppConstants.spacingLg),
                        IconButton(
                          icon: const Icon(Icons.chat_bubble_outline),
                          onPressed: () {},
                        ),
                        Text('${(index + 1) * 5}'),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.bookmark_border),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.share_outlined),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Show create post dialog
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Create post coming soon!')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
