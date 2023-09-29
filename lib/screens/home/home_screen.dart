import 'package:bloc_demo_api/cubits/InternetCubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
        if (state == InternetState.connected) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Connected"),
            backgroundColor: Colors.green,
          ));
        } else if (state == InternetState.disconnected) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Not Connected"), backgroundColor: Colors.red));
        }
      }, builder: (context, state) {
        if (state == InternetState.connected) {
          return const Center(child: Text("Connected"));
        } else if (state == InternetState.disconnected) {
          return Center(child:  Text("Not Connected ${state.name}"));
        } else {
          return const Center(child: Text("Loading"));
        }
      }),
    );
  }
}
