import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_colors.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final String chatId;

  const ChatScreen({super.key, required this.chatId});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  // Mock messages
  final _messages = [
    {'id': '1', 'senderId': 'other', 'content': 'Hey! How are you?', 'time': '10:00'},
    {'id': '2', 'senderId': 'me', 'content': 'I\'m good, thanks! How about you?', 'time': '10:01'},
    {'id': '3', 'senderId': 'other', 'content': 'Great! Did you finish the assignment?', 'time': '10:02'},
    {'id': '4', 'senderId': 'me', 'content': 'Almost done. Just need to review the last part.', 'time': '10:05'},
    {'id': '5', 'senderId': 'other', 'content': 'Nice! Let me know if you need help.', 'time': '10:06'},
    {'id': '6', 'senderId': 'me', 'content': 'Thanks! Will do.', 'time': '10:07'},
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'senderId': 'me',
        'content': _messageController.text.trim(),
        'time': TimeOfDay.now().format(context),
      });
    });

    _messageController.clear();

    // Scroll to bottom
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              child: Text('U'),
            ),
            const SizedBox(width: AppConstants.spacingMd),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chat ${widget.chatId}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'Online',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.online,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(AppConstants.spacingLg),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isMe = message['senderId'] == 'me';

                return Padding(
                  padding: const EdgeInsets.only(bottom: AppConstants.spacingSm),
                  child: Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.spacingLg,
                          vertical: AppConstants.spacingMd,
                        ),
                        decoration: BoxDecoration(
                          color: isMe
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(AppConstants.radiusLg),
                            topRight: const Radius.circular(AppConstants.radiusLg),
                            bottomLeft: Radius.circular(
                              isMe ? AppConstants.radiusLg : AppConstants.radiusSm,
                            ),
                            bottomRight: Radius.circular(
                              isMe ? AppConstants.radiusSm : AppConstants.radiusLg,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              message['content']!,
                              style: TextStyle(
                                color: isMe
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              message['time']!,
                              style: TextStyle(
                                fontSize: 10,
                                color: isMe
                                    ? Theme.of(context).colorScheme.onPrimary.withAlpha(180)
                                    : Theme.of(context).colorScheme.onSurface.withAlpha(150),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Message input
          Container(
            padding: const EdgeInsets.all(AppConstants.spacingMd),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppConstants.radiusFull),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.spacingLg,
                          vertical: AppConstants.spacingMd,
                        ),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: AppConstants.spacingSm),
                  IconButton.filled(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
