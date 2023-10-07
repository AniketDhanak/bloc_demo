import 'package:bloc_demo_api/constants/route_constants.dart';
import 'package:bloc_demo_api/screens/addPost/add_post_screen.dart';
import 'package:bloc_demo_api/screens/addPost/bloc/add_post_bloc.dart';
import 'package:bloc_demo_api/screens/home/bloc/home_screen_cubit.dart';
import 'package:bloc_demo_api/screens/home/home_screen.dart';
import 'package:bloc_demo_api/screens/splash/bloc/splash_cubit.dart';
import 'package:bloc_demo_api/screens/splash/splash_screen.dart';
import 'package:bloc_demo_api/screens/userDetails/bloc/last_screen_cubit.dart';
import 'package:bloc_demo_api/screens/userDetails/user_details_screen.dart';
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
      case RouteConstants.userDetailsScreen:
        Map<String,dynamic> args = settings.arguments as Map<String,dynamic>;
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(create: (context) => LastScreenCubit(),
                  child:  UserDetailsScreen(usersModel: args['data'],),));
      case RouteConstants.addPostScreen:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(create: (context) => AddPostBloc(),
                  child:  const AddPostScreen(),));

      default : return null;
    }
  }

}