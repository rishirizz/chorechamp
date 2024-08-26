import 'package:chorechamp/core/enums.dart';
import 'package:chorechamp/core/widgets/chore_champ_loading_widget.dart';
import 'package:chorechamp/core/widgets/chore_champ_appbar.dart';
import 'package:chorechamp/core/widgets/chore_champ_fab.dart';
import 'package:chorechamp/feature/chore/bloc/chore_bloc.dart';
import 'package:chorechamp/feature/chore/model/chore_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/route/route_constants.dart';
import '../constants/constants.dart';

class ChoresHistoryScreen extends StatelessWidget {
  const ChoresHistoryScreen({super.key});

  static String routeName = ChoreChampRouteConstants.choresHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChoreChampAppBar(
        labelText: ChoreConstants.yourChores,
      ),
      floatingActionButton: ChoreChampFAB(
        labelText: ChoreConstants.addchore,
        onPressed: () {
          context.read<ChoreBloc>().add(
                AddChore(
                  chore: Chore(
                    id: DateTime.now().toString(),
                    title: 'Coding Practice',
                    description: 'Try Bubble Sorting',
                    dateTime: DateTime.now(),
                  ),
                ),
              );
        },
      ),
      body: SafeArea(
        child: BlocBuilder<ChoreBloc, ChoreState>(
          builder: (context, state) {
            if (state.choreStatus == ChoresStatus.loading) {
              return const ChoreChampLoadingWidget();
            } else if (state.choreStatus == ChoresStatus.success) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  context.read<ChoreBloc>().add(
                        OnScroll(
                          scrollDirection: notification.direction,
                        ),
                      );
                  return true;
                },
                child: ListView.builder(
                  itemCount: state.chores.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.chores[index].id),
                            Text(state.chores[index].title),
                            Text(state.chores[index].description),
                            Text(state.chores[index].dateTime.toString()),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
