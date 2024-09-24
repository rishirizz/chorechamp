import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chore_bloc.dart';

class RecentChoresList extends StatelessWidget {
  const RecentChoresList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoreBloc, ChoreState>(
      builder: (context, state) {
        return (state.chores.isNotEmpty)
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: (state.chores.length > 5) ? 5 : state.chores.length,
                itemBuilder: (context, index) => SizedBox(
                  width: 200,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.chores[index].title!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(
                            color: Colors.deepPurple,
                          ),
                          Text(
                            state.chores[index].description!,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
