import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../routing/router.dart';

@RoutePage()
class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        // FeedRoute(),
        AddWorkoutRoute(),
        // StatsRoute(),
        // ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              selectedColor: Colors.purple[600],
              unselectedColor: Colors.purple[200],
              icon: const Icon(
                Icons.dashboard,
                size: 30,
              ),
              title: const Text('Home'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.purple[600],
              unselectedColor: Colors.purple[200],
              icon: const Icon(
                Icons.add,
                size: 30,
              ),
              title: const Text('Add'),
            ),
            // SalomonBottomBarItem(
            //   selectedColor: Colors.purple[600],
            //   unselectedColor: Colors.purple[200],
            //   icon: const Icon(
            //     Icons.bar_chart,
            //     size: 30,
            //   ),
            //   title: const Text('Stats'),
            // ),
          ],
        );
      },
    );
  }
}
