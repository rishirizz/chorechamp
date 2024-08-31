import 'package:flutter/material.dart';

class ChoreChampBottomNavBar extends StatelessWidget {
  const ChoreChampBottomNavBar({
    required this.items,
    required this.currentIndex,
    required this.onTap,
    super.key,
  });
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      onTap: (index) {
        onTap();
      },
    );
  }
}
