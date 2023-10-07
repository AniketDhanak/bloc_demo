import 'package:bloc_demo_api/constants/color_constants.dart';
import 'package:bloc_demo_api/constants/route_constants.dart';
import 'package:bloc_demo_api/constants/string_constants.dart';
import 'package:bloc_demo_api/constants/style_constants.dart';
import 'package:bloc_demo_api/models/network/users_model.dart';
import 'package:bloc_demo_api/utils/size_config.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  final UsersModel usersModel;

  const UserDetailsScreen({super.key, required this.usersModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          StringConstants.userDetails,
          style: StyleConstants.h416PxStyleMedium(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2.0, vertical: SizeConfig.heightMultiplier * 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.heightMultiplier * 0.5,),
            Text(StringConstants.personalDetails,
              style: StyleConstants.h818PxStyleBold(color: AppColors.black),),
            SizedBox(height: SizeConfig.heightMultiplier * 0.5,),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2.0, vertical: SizeConfig.heightMultiplier * 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("id: ${usersModel.id}",
                        style: StyleConstants.h514PxStyleMedium(color: AppColors.black),),
                      Text("Name: ${usersModel.name}",
                        style: StyleConstants.h514PxStyleMedium(color: AppColors.black),),
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
            Text(StringConstants.address,
              style: StyleConstants.h818PxStyleBold(color: AppColors.black),),
            SizedBox(height: SizeConfig.heightMultiplier * 0.5,),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2.0, vertical: SizeConfig.heightMultiplier * 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Street: ${usersModel.address.street}",
                        style: StyleConstants.h514PxStyleMedium(color: AppColors.black),),
                      Text("Suite: ${usersModel.address.suite}",
                        style: StyleConstants.h514PxStyleMedium(color: AppColors.black),),
                      SizedBox(height: SizeConfig.heightMultiplier * 0.5,),
                      Text("City: ${usersModel.address.city}",
                        style: StyleConstants.h514PxStyleMedium(color: AppColors.black),),
                      SizedBox(height: SizeConfig.heightMultiplier * 0.5,),
                      Text("Zipcode: ${usersModel.address.zipcode}",
                        style: StyleConstants.h514PxStyleMedium(color: AppColors.black),),
                      SizedBox(height: SizeConfig.heightMultiplier * 0.5,),
                      Text("Geo: ${usersModel.address.geo.lat}, ${usersModel.address.geo.lng}",
                        style: StyleConstants.h514PxStyleMedium(color: AppColors.black),),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
