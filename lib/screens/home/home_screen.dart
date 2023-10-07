import 'package:bloc_demo_api/constants/color_constants.dart';
import 'package:bloc_demo_api/constants/route_constants.dart';
import 'package:bloc_demo_api/constants/string_constants.dart';
import 'package:bloc_demo_api/constants/style_constants.dart';
import 'package:bloc_demo_api/screens/home/bloc/home_screen_cubit.dart';
import 'package:bloc_demo_api/screens/home/bloc/home_screen_states.dart';
import 'package:bloc_demo_api/screens/home/users_card_widget.dart';
import 'package:bloc_demo_api/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          StringConstants.homeScreen,
          style: StyleConstants.h416PxStyleMedium(color: AppColors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteConstants.addPostScreen).then((value) {
                  BlocProvider.of<HomeScreenCubit>(context).getAllUsers();
                });
              },
              icon: Icon(
                Icons.add,
                size: SizeConfig.imageSizeMultiplier * 10,
              ))
        ],
      ),
      body: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) {
          if(state is NoInternetState){
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("No Internet...!")));
          }
        },
        builder: (context, state) {
          if (state is HomeScreenLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeScreenErrorState) {
          } else if (state is HomeScreenLoadedState) {
            return ListView.builder(
                itemCount: state.userList.length,
                itemBuilder: (context, index) {
                  return UsersCard(
                    usersModel: state.userList[index],
                  );
                });
          }
          return const Text("Something went wrong");
        },
      ),
    );
  }
}
