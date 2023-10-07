import 'package:bloc_demo_api/constants/color_constants.dart';
import 'package:bloc_demo_api/constants/route_constants.dart';
import 'package:bloc_demo_api/constants/style_constants.dart';
import 'package:bloc_demo_api/models/network/users_model.dart';
import 'package:bloc_demo_api/utils/size_config.dart';
import 'package:flutter/material.dart';

class UsersCard extends StatelessWidget {
  final UsersModel usersModel;
  const UsersCard({super.key, required this.usersModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2, vertical: SizeConfig.heightMultiplier * 0 ),
      child: GestureDetector(
        onTap: (){
          var args = {
            "data": usersModel,
          };
          Navigator.of(context).pushNamed(RouteConstants.userDetailsScreen, arguments: args);
        },
        child: Card(
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2, vertical: SizeConfig.heightMultiplier * 1 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text("Name: ${usersModel.name}",
                      style: StyleConstants.h514PxStyleMedium(color: AppColors.black),),
                    ),
                    Text("id: ${usersModel.id}",
                      style: StyleConstants.h514PxStyleMedium(color: AppColors.black),)
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 0.5,),
                Text("username: ${usersModel.username}",
                  style: StyleConstants.h514PxStyleMedium(color: AppColors.black),),
                SizedBox(height: SizeConfig.heightMultiplier * 0.5,),
                Text("Email: ${usersModel.email}",
                  style: StyleConstants.h514PxStyleMedium(color: AppColors.black),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
