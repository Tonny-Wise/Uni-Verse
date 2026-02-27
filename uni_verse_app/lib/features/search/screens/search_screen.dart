import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search Uni-Verse...',
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                      });
                    },
                  )
                : null,
          ),
          onChanged: (value) => setState(() {}),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'People'),
            Tab(text: 'Posts'),
            Tab(text: 'Groups'),
            Tab(text: 'Universities'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // People tab
          _buildPeopleTab(),
          // Posts tab
          _buildPostsTab(),
          // Groups tab
          _buildGroupsTab(),
          // Universities tab
          _buildUniversitiesTab(),
        ],
      ),
    );
  }

  Widget _buildPeopleTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.spacingLg),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text('U${index + 1}'),
          ),
          title: Text('User ${index + 1}'),
          subtitle: Text('@user${index + 1} · University ${(index % 3) + 1}'),
          trailing: OutlinedButton(
            onPressed: () {},
            child: const Text('Follow'),
          ),
        );
      },
    );
  }

  Widget _buildPostsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.spacingLg),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: AppConstants.spacingMd),
          child: ListTile(
            title: Text('Post ${index + 1}'),
            subtitle: Text('Sample post content here...'),
          ),
        );
      },
    );
  }

  Widget _buildGroupsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.spacingLg),
      itemCount: 6,
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
            title: Text('Group ${index + 1}'),
            subtitle: Text('${(index + 1) * 100} members'),
            trailing: OutlinedButton(
              onPressed: () {},
              child: const Text('Join'),
            ),
          ),
        );
      },
    );
  }

  Widget _buildUniversitiesTab() {
    final universities = [
      'Makerere University',
      'Kyambogo University',
      'Uganda Christian University',
      'Makerere University Business School',
      'Gulu University',
      'Mbarara University',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.spacingLg),
      itemCount: universities.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: const Icon(Icons.school),
          ),
          title: Text(universities[index]),
          subtitle: Text('${(index + 1) * 1000}+ students'),
        );
      },
    );
  }
}
