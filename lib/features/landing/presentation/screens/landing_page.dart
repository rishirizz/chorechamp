import 'package:chorechamp/core/constants/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../bloc/bottom_nav_bloc.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  static String routeName = ChoreChampRouteConstants.landingScreen;

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: LandingConstants.items,
            currentIndex: state.selectedIndex,
            onTap: (index) {
              context.read<BottomNavBloc>().add(
                    BottomNavPageChanged(
                      selectedIndex: index,
                    ),
                  );
            },
          ),
          body: SafeArea(
            child: LandingConstants.pageOptions[state.selectedIndex],
          ),
        );
      },
    );
  }
}
