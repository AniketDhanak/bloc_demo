import 'package:bloc_demo_api/bloc/authBloc/auth_cubit.dart';
import 'package:bloc_demo_api/bloc/authBloc/auth_states.dart';
import 'package:bloc_demo_api/screens/SignInScreen/sign_in_screen.dart';
import 'package:bloc_demo_api/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BlocBuilder<AuthCubit, AuthStates>(
            buildWhen: (oldState, newState){
              return oldState is AuthInitState;
            },
            builder: (context, state) {
              if(state is AuthLoggedInState){
                return HomeScreen();
              }else if(state is AuthLoggedOutState){
                return SignInScreen();
              }else{
                return Scaffold();
              }

            },
          )
      ),
    );
  }
}
