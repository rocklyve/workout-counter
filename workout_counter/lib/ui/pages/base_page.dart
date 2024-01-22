import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
        StatsRoute(),
        // ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.dashboard)),
            // BottomNavigationBarItem(label: 'Feed', icon: Icon(Icons.feed)),
            BottomNavigationBarItem(label: 'Add', icon: Icon(Icons.add)),
            BottomNavigationBarItem(label: 'Stats', icon: Icon(Icons.bar_chart)),
            // BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          ],
        );
      },
    );
  }
}
