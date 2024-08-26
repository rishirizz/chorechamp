import 'package:chorechamp/core/utils/chore_champ_router.dart';
import 'package:chorechamp/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:chorechamp/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/chore/presentation/bloc/chore_bloc.dart';

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
