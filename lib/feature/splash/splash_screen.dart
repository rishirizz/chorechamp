import 'package:chorechamp/core/enums.dart';
import 'package:chorechamp/core/route/route_constants.dart';
import 'package:chorechamp/feature/chore/constants/constants.dart';
import 'package:chorechamp/feature/chore/screens/chores_screen.dart';
import 'package:chorechamp/feature/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = ChoreChampRouteConstants.splashScreen;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(SplashLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.splashStatus == SplashStatus.success) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            ChoresScreen.routeName,
            (Route<dynamic> route) => false,
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Text(
              ChoreConstants.choreChamp,
            ),
          ),
        ),
      ),
    );
  }
}
