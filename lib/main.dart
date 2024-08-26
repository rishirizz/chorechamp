import 'package:chorechamp/core/route/chore_champ_router.dart';
import 'package:chorechamp/feature/splash/bloc/splash_bloc.dart';
import 'package:chorechamp/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/chore/bloc/chore_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashBloc(),
        ),
        BlocProvider(
          create: (context) => ChoreBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: HighContrastBlackTheme.theme,
        home: const SplashScreen(),
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder = ChoreChampRouter().getPageRoute(settings);
          return MaterialPageRoute(
            builder: (ctx) {
              return builder(ctx);
            },
          );
        },
      ),
    );
  }
}
