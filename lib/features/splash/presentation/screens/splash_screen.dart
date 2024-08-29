import 'package:chorechamp/core/core_features/app_info/bloc/app_info_bloc.dart';
import 'package:chorechamp/core/enums/enums.dart';
import 'package:chorechamp/core/constants/route_constants.dart';
import 'package:chorechamp/core/core_features/app_info/app_info.dart';
import 'package:chorechamp/core/widgets/chore_champ_loading_widget.dart';
import 'package:chorechamp/features/chore/constants/constants.dart';
import 'package:chorechamp/features/chore/presentation/screens/chores_screen.dart';
import 'package:chorechamp/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = ChoreChampRouteConstants.splashScreen;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<String> _appVersion;
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(SplashLoaded());
    context.read<AppInfoBloc>().add(AppInfoLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state.splashStatus == SplashStatus.success) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                ChoresScreen.routeName,
                (Route<dynamic> route) => false,
              );
            }
          },
        ),
        // BlocListener<AppInfoBloc, AppInfoState>(
        //   listener: (context, state) {
        //     if (state.appInfoStatus == AppInfoStatus.success) {
        //       Navigator.pushNamedAndRemoveUntil(
        //         context,
        //         ChoresScreen.routeName,
        //         (Route<dynamic> route) => false,
        //       );
        //     }
        //   },
        // ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ChoreConstants.choreChamp,
              ),
              BlocBuilder<AppInfoBloc, AppInfoState>(
                builder: (context, state) {
                  if (state.appInfoStatus == AppInfoStatus.loading) {
                    return const ChoreChampLoadingWidget();
                  } else if (state.appInfoStatus == AppInfoStatus.success) {
                    return Text(
                      state.version,
                    );
                  } else {
                    return Text(state.errorText);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
