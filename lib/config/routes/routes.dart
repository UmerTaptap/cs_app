import 'package:bot_toast/bot_toast.dart';
import 'package:cs_app/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/observers/go_router_observer.dart';
import '../../di.dart';
import '../../features/home/bloc/home_bloc.dart';
import '../../features/home/view/home_view.dart';

class Routes {


  void clearAllRoute(BuildContext context) {
    while (GoRouter.of(context).canPop() == true) {
      GoRouter.of(context).pop();
    }
  }


  static final GoRouter _router = GoRouter(
    initialLocation: RoutesName.initial,
    observers: [
      GoRouterObserver(),
      BotToastNavigatorObserver(),
    ],



    routes: [
      GoRoute(
        path: RoutesName.initial,
        name: RoutesName.initial,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<HomeBloc>(),
            child: const HomeView(),
          );
        }
      ),
    ],
  );

  static GoRouter get router => _router;

}