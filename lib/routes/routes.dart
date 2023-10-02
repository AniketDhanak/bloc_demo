import 'package:bloc_demo_api/constants/route_constants.dart';
import 'package:bloc_demo_api/screens/home/bloc/home_screen_cubit.dart';
import 'package:bloc_demo_api/screens/home/home_screen.dart';
import 'package:bloc_demo_api/screens/lastScreen/bloc/last_screen_cubit.dart';
import 'package:bloc_demo_api/screens/lastScreen/last_screen.dart';
import 'package:bloc_demo_api/screens/splash/bloc/splash_cubit.dart';
import 'package:bloc_demo_api/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.initRoute:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(create: (context) => SplashCubit(),
                  child: const SplashScreen(),));
      case RouteConstants.homeScreen:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(create: (context) => HomeScreenCubit(),
                  child: const HomeScreen(),));
      case RouteConstants.lastScreen:
        Map<String,dynamic> args = settings.arguments as Map<String,dynamic>;
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(create: (context) => LastScreenCubit(),
                  child:  LastScreen(title: args['title'],),));

      default : return null;
    }
  }

}