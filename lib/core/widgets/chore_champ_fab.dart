import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/chore/bloc/chore_bloc.dart';

class ChoreChampFAB extends StatelessWidget {
  const ChoreChampFAB(
      {required this.labelText, required this.onPressed, super.key});
  final String labelText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoreBloc, ChoreState>(
      builder: (context, state) {
        return (state.scrollDirection == ScrollDirection.idle)
            ? FloatingActionButton.extended(
                icon: const Icon(
                  Icons.add,
                  size: 40,
                ),
                extendedIconLabelSpacing: 2,
                onPressed: onPressed,
                label: Text(labelText),
              )
            : const SizedBox();
      },
    );
  }
}
