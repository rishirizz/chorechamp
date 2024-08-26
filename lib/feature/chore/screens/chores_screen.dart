import 'package:chorechamp/core/route/route_constants.dart';
import 'package:chorechamp/core/widgets/chore_champ_loading_widget.dart';
import 'package:chorechamp/core/widgets/chore_champ_fab.dart';
import 'package:chorechamp/feature/chore/bloc/chore_bloc.dart';
import 'package:chorechamp/feature/chore/constants/constants.dart';
import 'package:chorechamp/feature/chore/model/chore_model.dart';
import 'package:chorechamp/feature/chore/screens/chores_history_screen.dart';
import 'package:chorechamp/feature/chore/widgets/recent_chores_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums.dart';
import '../widgets/user_header_widget.dart';

class ChoresScreen extends StatefulWidget {
  const ChoresScreen({super.key});

  static String routeName = ChoreChampRouteConstants.homeScreen;

  @override
  State<ChoresScreen> createState() => _ChoresScreenState();
}

class _ChoresScreenState extends State<ChoresScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ChoreBloc>().add(
          FetchChores(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserHeaderWidget(),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<ChoreBloc, ChoreState>(
              builder: (context, state) {
                if (state.choreStatus == ChoresStatus.loading) {
                  return const ChoreChampLoadingWidget();
                } else if (state.chores.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(ChoreConstants.noChoresAddedYet),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0)
                            .copyWith(
                          bottom: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Your recent Chores'),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  ChoresHistoryScreen.routeName,
                                );
                              },
                              child: const Text(
                                'View All',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      NotificationListener<UserScrollNotification>(
                        onNotification: (notification) {
                          context.read<ChoreBloc>().add(
                                OnScroll(
                                  scrollDirection: notification.direction,
                                ),
                              );
                          return true;
                        },
                        child: RefreshIndicator.adaptive(
                          onRefresh: () async {
                            context.read<ChoreBloc>().add(
                                  FetchChores(),
                                );
                          },
                          child: const SizedBox(
                            height: 150,
                            child: RecentChoresList(),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
