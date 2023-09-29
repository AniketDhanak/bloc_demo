import 'package:bloc_demo_api/blocs/InternetBloc/internet_bloc.dart';
import 'package:bloc_demo_api/blocs/InternetBloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocConsumer<InternetBloc, InternetState>(listener: (context, state) {
        if (state is InternetConnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Connected"),
            backgroundColor: Colors.green,
          ));
        } else if (state is InternetConnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Not Connected"), backgroundColor: Colors.red));
        }
      }, builder: (context, state) {
        if (state is InternetConnectedState) {
          return Center(child: const Text("Connected"));
        } else if (state is InternetConnectedState) {
          return Center(child: const Text("Not Connected"));
        } else {
          return Center(child: const Text("Loading"));
        }
      }),
    );
  }
}
