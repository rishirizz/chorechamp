import 'package:chorechamp/core/constants/route_constants.dart';
import 'package:chorechamp/core/widgets/chore_champ_loading_widget.dart';
import 'package:chorechamp/features/chore/presentation/bloc/chore_bloc.dart';
import 'package:chorechamp/features/chore/constants/constants.dart';
import 'package:chorechamp/features/chore/presentation/screens/chores_history_screen.dart';
import 'package:chorechamp/features/chore/presentation/widgets/recent_chores_list.dart';
import 'package:chorechamp/features/chore/presentation/widgets/recent_chores_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/enums.dart';
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
            const RecentChoresView(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Expanded(
                    child: SizedBox(
                      child: Text('data'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Colors.purple.shade100,
                            child: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Icon(Icons.list),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text('To do List'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Colors.indigo.shade100,
                            child: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Icon(Icons.list),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text('In Progress'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
