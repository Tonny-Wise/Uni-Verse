import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_colors.dart';

class VideoCallScreen extends ConsumerStatefulWidget {
  final String callId;

  const VideoCallScreen({super.key, required this.callId});

  @override
  ConsumerState<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends ConsumerState<VideoCallScreen> {
  bool _isMuted = false;
  bool _isVideoOff = false;
  bool _isScreenSharing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Video grid
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spacingSm),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppConstants.spacingSm,
                    mainAxisSpacing: AppConstants.spacingSm,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(AppConstants.radiusLg),
                      ),
                      child: Stack(
                        children: [
                          // Video placeholder
                          Center(
                            child: CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.grey.shade700,
                              child: Text(
                                index == 0 ? 'You' : 'U${index}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          // Name tag
                          Positioned(
                            left: AppConstants.spacingSm,
                            bottom: AppConstants.spacingSm,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppConstants.spacingSm,
                                vertical: AppConstants.spacingXxs,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(AppConstants.radiusSm),
                              ),
                              child: Text(
                                index == 0 ? 'You' : 'User $index',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          // Mute indicator
                          if (index > 0 && index % 2 == 0)
                            Positioned(
                              right: AppConstants.spacingSm,
                              bottom: AppConstants.spacingSm,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.mic_off,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            // Top bar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(AppConstants.spacingLg),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withAlpha(200),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Call ${widget.callId}',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          const Text(
                            '00:05:23',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.fullscreen, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            // Bottom controls
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(AppConstants.spacingXl),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withAlpha(200),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Mute button
                    _buildControlButton(
                      icon: _isMuted ? Icons.mic_off : Icons.mic,
                      label: _isMuted ? 'Unmute' : 'Mute',
                      isActive: _isMuted,
                      onPressed: () {
                        setState(() {
                          _isMuted = !_isMuted;
                        });
                      },
                    ),
                    // Video button
                    _buildControlButton(
                      icon: _isVideoOff ? Icons.videocam_off : Icons.videocam,
                      label: _isVideoOff ? 'Start Video' : 'Stop Video',
                      isActive: _isVideoOff,
                      onPressed: () {
                        setState(() {
                          _isVideoOff = !_isVideoOff;
                        });
                      },
                    ),
                    // Screen share button
                    _buildControlButton(
                      icon: Icons.screen_share,
                      label: 'Share',
                      isActive: _isScreenSharing,
                      onPressed: () {
                        setState(() {
                          _isScreenSharing = !_isScreenSharing;
                        });
                      },
                    ),
                    // Chat button
                    _buildControlButton(
                      icon: Icons.chat,
                      label: 'Chat',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Chat coming soon!')),
                        );
                      },
                    ),
                    // End call button
                    _buildControlButton(
                      icon: Icons.call_end,
                      label: 'End',
                      isDestructive: true,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    bool isActive = false,
    bool isDestructive = false,
    required VoidCallback onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: isDestructive
                ? AppColors.error
                : isActive
                    ? Colors.white
                    : Colors.white.withAlpha(30),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon),
            color: isDestructive || isActive ? Colors.white : Colors.white,
            iconSize: 24,
            onPressed: onPressed,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
