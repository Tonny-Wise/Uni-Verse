import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_colors.dart';

class VideoCallsScreen extends ConsumerWidget {
  const VideoCallsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock video calls
    final calls = [
      {'id': '1', 'title': 'CS 301 - Study Group Session', 'host': 'Amina Nakato', 'status': 'live', 'participants': 4},
      {'id': '2', 'title': 'Inter-Uni Hackathon Planning', 'host': 'You', 'status': 'scheduled', 'time': 'Today, 4:00 PM', 'participants': 5},
      {'id': '3', 'title': 'Medical Ethics Discussion', 'host': 'Eva Nassali', 'status': 'scheduled', 'time': 'Tomorrow, 2:00 PM', 'participants': 2},
      {'id': '4', 'title': 'Engineering Project Review', 'host': 'Brian Ouma', 'status': 'ended', 'duration': '1:23:45', 'participants': 3},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Calls'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.spacingLg),
        children: [
          // Quick actions
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Start call coming soon!')),
                    );
                  },
                  icon: const Icon(Icons.videocam),
                  label: const Text('Start Call'),
                ),
              ),
              const SizedBox(width: AppConstants.spacingMd),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Schedule call coming soon!')),
                    );
                  },
                  icon: const Icon(Icons.schedule),
                  label: const Text('Schedule'),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppConstants.spacingXl),

          // Calls list
          ...calls.map((call) {
            final isLive = call['status'] == 'live';
            final isEnded = call['status'] == 'ended';

            return Card(
              margin: const EdgeInsets.only(bottom: AppConstants.spacingMd),
              child: InkWell(
                onTap: () {
                  if (!isEnded) {
                    context.push('/video/${call['id']}');
                  }
                },
                borderRadius: BorderRadius.circular(AppConstants.radiusLg),
                child: Padding(
                  padding: const EdgeInsets.all(AppConstants.spacingLg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Status badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppConstants.spacingSm,
                              vertical: AppConstants.spacingXxs,
                            ),
                            decoration: BoxDecoration(
                              color: isLive
                                  ? AppColors.error
                                  : isEnded
                                      ? AppColors.lightMutedForeground
                                      : Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(AppConstants.radiusSm),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (isLive) ...[
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                ],
                                Text(
                                  isLive
                                      ? 'Live'
                                      : isEnded
                                          ? 'Ended'
                                          : 'Scheduled',
                                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            isEnded
                                ? call['duration'] as String
                                : isLive
                                    ? 'Now'
                                    : call['time'] as String,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: AppConstants.spacingMd),
                      Text(
                        call['title'] as String,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: AppConstants.spacingXs),
                      Text(
                        'Host: ${call['host']}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: AppConstants.spacingMd),
                      Row(
                        children: [
                          // Participants avatars
                          SizedBox(
                            width: 80,
                            height: 28,
                            child: Stack(
                              children: List.generate(
                                (call['participants'] as int).clamp(0, 4),
                                (index) => Positioned(
                                  left: index * 18.0,
                                  child: Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).colorScheme.primaryContainer,
                                      border: Border.all(
                                        color: Theme.of(context).cardColor,
                                        width: 2,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'U',
                                        style: Theme.of(context).textTheme.labelSmall,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '${call['participants']} participants',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Spacer(),
                          if (isLive)
                            ElevatedButton(
                              onPressed: () => context.push('/video/${call['id']}'),
                              child: const Text('Join'),
                            )
                          else if (!isEnded)
                            OutlinedButton(
                              onPressed: () => context.push('/video/${call['id']}'),
                              child: const Text('View'),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
