import 'package:bot_toast/bot_toast.dart';
import 'package:cs_app/core/custom/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'config/routes/routes.dart';
import 'core/globals/blocs/theme/theme_bloc.dart';
import 'di.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize Google Gemini AI
  Gemini.init(apiKey: 'AIzaSyAamZnC3rXzQKNLwC_8ju0p-ScLylh9JEE');

  // initialize dependency injection
  await initDI();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeBloc>(
        create: (context) => sl<ThemeBloc>(),
      ),
    ],
    child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {


    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          print("state: $state");
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'WAC',
            theme: state is ThemeLight ? AppThemes.lightTheme : AppThemes.darkTheme,
            routerDelegate: Routes.router.routerDelegate,
            routeInformationParser: Routes.router.routeInformationParser,
            routeInformationProvider: Routes.router.routeInformationProvider,
            builder: BotToastInit(),

          );
        },
      ),
    );
  }
}
