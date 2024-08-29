import 'package:flutter/material.dart';

class ChoreChampPullToRefresh extends StatelessWidget {
  const ChoreChampPullToRefresh({
    super.key,
    required this.onPullToRefresh,
    required this.child,
  });
  final VoidCallback onPullToRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        onPullToRefresh();
      },
      child: child,
    );
  }
}
