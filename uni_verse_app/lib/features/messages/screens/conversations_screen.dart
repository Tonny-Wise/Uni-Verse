import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';

class ConversationsScreen extends ConsumerStatefulWidget {
  const ConversationsScreen({super.key});

  @override
  ConsumerState<ConversationsScreen> createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends ConsumerState<ConversationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Unread'),
            Tab(text: 'Groups'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('New message coming soon!')),
              );
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildConversationList(all: true),
          _buildConversationList(unreadOnly: true),
          _buildConversationList(groupsOnly: true),
        ],
      ),
    );
  }

  Widget _buildConversationList({
    bool all = false,
    bool unreadOnly = false,
    bool groupsOnly = false,
  }) {
    final count = groupsOnly ? 3 : (unreadOnly ? 4 : 7);

    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, index) {
        final isGroup = groupsOnly || (index % 3 == 2);
        final hasUnread = index < 3;

        return ListTile(
          onTap: () => context.push('/messages/conv_$index'),
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 24,
                child: isGroup
                    ? const Icon(Icons.group)
                    : Text('U${index + 1}'),
              ),
              if (hasUnread)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          title: Row(
            children: [
              Text(
                isGroup ? 'Group Chat ${index + 1}' : 'User ${index + 1}',
                style: TextStyle(
                  fontWeight: hasUnread ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              if (hasUnread) ...[
                const Spacer(),
                Text(
                  '${index + 1}m',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ],
          ),
          subtitle: Row(
            children: [
              Expanded(
                child: Text(
                  'Last message preview for conversation ${index + 1}...',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: hasUnread ? FontWeight.w500 : FontWeight.normal,
                  ),
                ),
              ),
              if (hasUnread)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(AppConstants.radiusFull),
                  ),
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
