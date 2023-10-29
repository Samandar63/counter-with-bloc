

import 'package:counter_app_bloc/cubit/counter_cubit.dart';
import 'package:counter_app_bloc/presentation/screens/home_screen.dart';
import 'package:counter_app_bloc/presentation/screens/second_screen.dart';
import 'package:counter_app_bloc/presentation/screens/third_screen.dart';
import 'package:counter_app_bloc/presentation/utils/widget_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: HomeScreen(
                      titleName: "Home Screen",
                      HomePageColor: WidgetColors.homePageColor),
                ));

      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: SecondScreen(
                      titleName: "Second Screen",
                      SecondPageColor: WidgetColors.SecondPageColor),
                ));

      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: ThirdScreen(
                      titleName: "Third Screen",
                      ThirdPageColor: WidgetColors.ThirdPageColor),
                ));

      default:
        return null;
    }
  }

  void dispose() {}
}
