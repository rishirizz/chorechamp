import 'package:flutter/material.dart';

import '../../chore/presentation/screens/chores_history_screen.dart';
import '../../chore/presentation/screens/chores_screen.dart';

class LandingConstants {
  static List<Widget> pageOptions = [
    const ChoresScreen(),
    const ChoresHistoryScreen(),
  ];
  static List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
  ];
}
