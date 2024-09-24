import 'package:chorechamp/core/enums/enums.dart';
import 'package:chorechamp/core/widgets/chore_champ_loading_widget.dart';
import 'package:chorechamp/core/widgets/chore_champ_appbar.dart';
import 'package:chorechamp/core/widgets/chore_champ_fab.dart';
import 'package:chorechamp/features/chore/presentation/bloc/chore_bloc.dart';
import 'package:chorechamp/features/chore/domain/entities/chore_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/widgets/chore_champ_pull_to_refresh.dart';
import '../../constants/constants.dart';

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
                  chore: ChoreEntity(
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
        child: BlocListener<ChoreBloc, ChoreState>(
          listener: (context, state) {
            if (state.isChoreAdded == true) {
              SnackBar snackBar = SnackBar(
                duration: const Duration(
                  seconds: 1,
                ),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                content: Text(
                  ChoreConstants.choreAdded,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: BlocBuilder<ChoreBloc, ChoreState>(
            builder: (context, state) {
              if (state.choreStatus == ChoresStatus.loading) {
                return const ChoreChampLoadingWidget();
              } else if (state.choreStatus == ChoresStatus.success) {
                return ChoreChampPullToRefresh(
                  onPullToRefresh: () {
                    context.read<ChoreBloc>().add(
                          FetchChores(),
                        );
                  },
                  child: NotificationListener<UserScrollNotification>(
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
                                Text(state.chores[index].id!),
                                Text(state.chores[index].title!),
                                Text(state.chores[index].description!),
                                Text(state.chores[index].dateTime.toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
