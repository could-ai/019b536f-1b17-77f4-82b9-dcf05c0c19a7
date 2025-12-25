import 'package:flutter/material.dart';
import 'package:couldai_user_app/core/data/mock_data.dart';
import 'package:couldai_user_app/features/prayer/widgets/prayer_strip.dart';
import 'package:couldai_user_app/features/tasks/widgets/task_card.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 800;
    final theme = Theme.of(context);

    return Scaffold(
      body: Row(
        children: [
          if (isWideScreen)
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Icon(LucideIcons.layoutGrid, color: theme.colorScheme.primary, size: 32),
              ),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(LucideIcons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(LucideIcons.checkSquare),
                  label: Text('Tasks'),
                ),
                NavigationRailDestination(
                  icon: Icon(LucideIcons.calendar),
                  label: Text('Calendar'),
                ),
                NavigationRailDestination(
                  icon: Icon(LucideIcons.settings),
                  label: Text('Settings'),
                ),
              ],
            ),
          if (isWideScreen) const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  title: Row(
                    children: [
                      if (!isWideScreen) ...[
                        Icon(LucideIcons.layoutGrid, color: theme.colorScheme.primary),
                        const SizedBox(width: 12),
                      ],
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Salam, Ahmed',
                            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Let\'s be productive today',
                            style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(LucideIcons.bell),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 8),
                    const CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Prayer Times',
                          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        const PrayerStrip(),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'My Tasks',
                              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            FilledButton.icon(
                              onPressed: () {},
                              icon: const Icon(LucideIcons.plus, size: 16),
                              label: const Text('New Task'),
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final task = MockData.tasks[index];
                        return TaskCard(task: task);
                      },
                      childCount: MockData.tasks.length,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 80)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: isWideScreen
          ? null
          : NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(LucideIcons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(LucideIcons.checkSquare),
                  label: 'Tasks',
                ),
                NavigationDestination(
                  icon: Icon(LucideIcons.calendar),
                  label: 'Calendar',
                ),
                NavigationDestination(
                  icon: Icon(LucideIcons.user),
                  label: 'Profile',
                ),
              ],
            ),
    );
  }
}
