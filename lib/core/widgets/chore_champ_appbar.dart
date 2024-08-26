import 'package:flutter/material.dart';

class ChoreChampAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChoreChampAppBar({
    required this.labelText,
    super.key,
  });
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(labelText),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
