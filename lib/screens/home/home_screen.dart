import 'package:bloc_demo_api/bloc/authBloc/auth_cubit.dart';
import 'package:bloc_demo_api/bloc/authBloc/auth_states.dart';
import 'package:bloc_demo_api/screens/SignInScreen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Auth Bloc"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Home Screen",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {
              if(state is AuthLoggedOutState){
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const SignInScreen()));
              }
            },
            builder: (context, state) {
              return ElevatedButton(onPressed: () {
                BlocProvider.of<AuthCubit>(context).logOut();
              }, child: const Text("Log Out"));
            },
          )
        ],
      ),
    );
  }
}
