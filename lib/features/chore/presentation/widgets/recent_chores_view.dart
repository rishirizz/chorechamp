import 'package:chorechamp/features/chore/presentation/widgets/recent_chores_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/widgets/chore_champ_loading_widget.dart';
import '../../constants/constants.dart';
import '../bloc/chore_bloc.dart';
import '../screens/chores_history_screen.dart';

class RecentChoresView extends StatelessWidget {
  const RecentChoresView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoreBloc, ChoreState>(
      builder: (context, state) {
        if (state.choreStatus == ChoresStatus.loading) {
          return const ChoreChampLoadingWidget();
        } else if (state.chores.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(ChoreConstants.noChoresAddedYet),
              ],
            ),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0).copyWith(
                  bottom: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ChoreConstants.yourRecentChores,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ChoresHistoryScreen.routeName,
                        );
                      },
                      child: Text(
                        ChoreConstants.viewAll,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
                child: RecentChoresList(),
              ),
            ],
          );
        }
      },
    );
  }
}
