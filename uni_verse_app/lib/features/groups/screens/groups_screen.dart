import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';

class GroupsScreen extends ConsumerStatefulWidget {
  const GroupsScreen({super.key});

  @override
  ConsumerState<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends ConsumerState<GroupsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _categories = ['All', 'Courses', 'Clubs', 'Study Groups', 'General'];
  int _selectedCategory = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        title: const Text('Groups'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Discover'),
            Tab(text: 'My Groups'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Category filter
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.spacingLg,
                vertical: AppConstants.spacingSm,
              ),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedCategory == index;
                return Padding(
                  padding: const EdgeInsets.only(right: AppConstants.spacingSm),
                  child: FilterChip(
                    label: Text(_categories[index]),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = index;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          // Groups list
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildDiscoverTab(),
                _buildMyGroupsTab(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Create group coming soon!')),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Create Group'),
      ),
    );
  }

  Widget _buildDiscoverTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.spacingLg),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: AppConstants.spacingLg),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => context.push('/groups/group_$index'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cover image
                Container(
                  height: 120,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: const Icon(Icons.group, size: 48),
                ),

                Padding(
                  padding: const EdgeInsets.all(AppConstants.spacingLg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Group ${index + 1}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppConstants.spacingSm,
                              vertical: AppConstants.spacingXxs,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(AppConstants.radiusSm),
                            ),
                            child: Text(
                              _categories[(index % 4) + 1],
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppConstants.spacingSm),
                      Text(
                        'A collaborative space for students to connect and share resources.',
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: AppConstants.spacingMd),
                      Row(
                        children: [
                          const Icon(Icons.people, size: 16),
                          const SizedBox(width: 4),
                          Text('${(index + 1) * 234} members'),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Join'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMyGroupsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.spacingLg),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: AppConstants.spacingMd),
          child: ListTile(
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: const Icon(Icons.group),
            ),
            title: Text('My Group ${index + 1}'),
            subtitle: Text('${(index + 1) * 100} members'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/groups/my_group_$index'),
          ),
        );
      },
    );
  }
}
