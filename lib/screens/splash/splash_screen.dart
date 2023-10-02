import 'package:bloc_demo_api/constants/route_constants.dart';
import 'package:bloc_demo_api/screens/splash/bloc/splash_cubit.dart';
import 'package:bloc_demo_api/screens/splash/bloc/splash_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashStates>(
      listener: (context, state) {
        if (state is SplashTimerEndState) {
          Navigator.of(context).pushReplacementNamed(RouteConstants.homeScreen);
        }
      },
      child: Scaffold(
        body: Center(
            child: Text(
          "Splash Screen",
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
