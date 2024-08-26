import 'package:flutter/material.dart';

class ChoreChampLoadingWidget extends StatelessWidget {
  const ChoreChampLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
