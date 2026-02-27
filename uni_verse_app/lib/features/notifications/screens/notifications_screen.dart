import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_colors.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Mock notifications
  final _notifications = [
    {'type': 'like', 'actor': 'Amina Nakato', 'content': 'liked your post', 'time': '2m ago', 'read': false},
    {'type': 'comment', 'actor': 'Christine Apio', 'content': 'commented on your study tip', 'time': '15m ago', 'read': false},
    {'type': 'follow', 'actor': 'Irene Babirye', 'content': 'started following you', 'time': '1h ago', 'read': false},
    {'type': 'group', 'actor': 'David Mugisha', 'content': 'invited you to join MUBS Entrepreneurs', 'time': '2h ago', 'read': true},
    {'type': 'mention', 'actor': 'Karen Atim', 'content': 'mentioned you in a post', 'time': '3h ago', 'read': true},
    {'type': 'like', 'actor': 'Eva Nassali', 'content': 'liked your comment', 'time': '5h ago', 'read': true},
    {'type': 'comment', 'actor': 'Brian Ouma', 'content': 'replied to your question', 'time': '6h ago', 'read': true},
    {'type': 'follow', 'actor': 'Grace Akello', 'content': 'started following you', 'time': '1d ago', 'read': true},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'like':
        return Icons.favorite;
      case 'comment':
        return Icons.chat_bubble;
      case 'follow':
        return Icons.person_add;
      case 'group':
        return Icons.group_add;
      case 'mention':
        return Icons.alternate_email;
      default:
        return Icons.notifications;
    }
  }

  Color _getNotificationColor(String type) {
    switch (type) {
      case 'like':
        return AppColors.likeColor;
      case 'comment':
        return AppColors.commentColor;
      case 'follow':
        return AppColors.followColor;
      case 'group':
        return AppColors.groupColor;
      case 'mention':
        return AppColors.mentionColor;
      default:
        return AppColors.messageColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Unread'),
            Tab(text: 'Mentions'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                for (var n in _notifications) {
                  n['read'] = true;
                }
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('All marked as read')),
              );
            },
            child: const Text('Mark all read'),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNotificationList(_notifications),
          _buildNotificationList(_notifications.where((n) => n['read'] == false).toList()),
          _buildNotificationList(_notifications.where((n) => n['type'] == 'mention').toList()),
        ],
      ),
    );
  }

  Widget _buildNotificationList(List<Map<String, dynamic>> notifications) {
    if (notifications.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_off_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
            ),
            const SizedBox(height: AppConstants.spacingLg),
            Text(
              'No notifications',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        final type = notification['type'] as String;
        final isRead = notification['read'] as bool;

        return ListTile(
          tileColor: isRead ? null : Theme.of(context).colorScheme.primaryContainer.withAlpha(30),
          leading: Stack(
            children: [
              CircleAvatar(
                child: Text(notification['actor'].toString()[0]),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: _getNotificationColor(type),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    _getNotificationIcon(type),
                    size: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          title: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: notification['actor'] as String,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' ${notification['content']}'),
              ],
            ),
          ),
          subtitle: Text(notification['time'] as String),
          trailing: type == 'follow'
              ? OutlinedButton(
                  onPressed: () {},
                  child: const Text('Follow Back'),
                )
              : type == 'group'
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('Join'),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Decline'),
                        ),
                      ],
                    )
                  : null,
        );
      },
    );
  }
}
