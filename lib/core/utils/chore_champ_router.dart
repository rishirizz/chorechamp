import 'package:chorechamp/features/chore/presentation/screens/chores_history_screen.dart';
import 'package:chorechamp/features/chore/presentation/screens/chores_screen.dart';
import 'package:chorechamp/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../features/landing/presentation/screens/landing_page.dart';

class ChoreChampRouter {
  getPageRoute(RouteSettings settings) {
    var routes = <String, WidgetBuilder>{
      SplashScreen.routeName: (BuildContext context) => const SplashScreen(),
      LandingScreen.routeName: (BuildContext context) => const LandingScreen(),
      ChoresScreen.routeName: (BuildContext context) => const ChoresScreen(),
      ChoresHistoryScreen.routeName: (BuildContext context) =>
          const ChoresHistoryScreen(),
    };
    return routes[settings.name];
  }
}
