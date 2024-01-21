import 'package:auto_route/auto_route.dart';
import 'package:workout_counter/ui/pages/workout_tracker.dart';

import '../ui/pages/add_workout_page.dart';
import '../ui/pages/base_page.dart';
import '../ui/pages/bluetooth_connection_page.dart';
import '../ui/pages/feed_page.dart';
import '../ui/pages/home_page.dart';
import '../ui/pages/profile_page.dart';
import '../ui/pages/stats_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: BaseRoute.page,
          path: '/base',
          initial: true,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: 'home',
            ),
            AutoRoute(
              page: FeedRoute.page,
              path: 'feed',
            ),
            AutoRoute(
              page: AddWorkoutRoute.page,
              path: 'add_workout',
            ),
            AutoRoute(
              page: StatsRoute.page,
              path: 'stats',
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
            ),
          ],
        ),
        AutoRoute(
          page: BluetoothConnectionRoute.page,
          path: '/home/bluetooth_connection',
          fullscreenDialog: true,
          meta: const <String, dynamic>{
            'bottomNavBarHidden': true,
          },
        ),
        AutoRoute(
          page: WorkoutTrackerRoute.page,
          path: '/add_workout/workout_tracker',
          fullscreenDialog: true,
          meta: const <String, dynamic>{
            'bottomNavBarHidden': true,
          },
        ),
        RedirectRoute(
          path: '*',
          redirectTo: '/',
        ),
      ];
}
