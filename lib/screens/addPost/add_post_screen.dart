import 'dart:developer';

import 'package:bloc_demo_api/constants/color_constants.dart';
import 'package:bloc_demo_api/constants/style_constants.dart';
import 'package:bloc_demo_api/screens/addPost/bloc/add_post_bloc.dart';
import 'package:bloc_demo_api/screens/addPost/bloc/add_post_events.dart';
import 'package:bloc_demo_api/screens/addPost/bloc/add_post_state.dart';
import 'package:bloc_demo_api/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Post",
          style: StyleConstants.h416PxStyleBold(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 2.0,
            vertical: SizeConfig.heightMultiplier * 2),
        child: Column(
          children: [
            BlocBuilder<AddPostBloc, AddPostState>(
              builder: (context, state) {
                return TextField(
                  controller: idController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    BlocProvider.of<AddPostBloc>(context)
                        .add(AddPostTextChangeIdEvent(idController.text));
                  },
                  decoration: InputDecoration(
                      labelText: "Enter Id",
                      errorText:
                          state is AddPostErrorIdState ? state.error : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4))),
                );
              },
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            BlocBuilder<AddPostBloc, AddPostState>(
              builder: (context, state) {
                return TextField(
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    BlocProvider.of<AddPostBloc>(context)
                        .add(AddPostTextChangeTitleEvent(titleController.text));
                  },
                  decoration: InputDecoration(
                      labelText: "Enter Title",
                      errorText:
                          state is AddPostErrorTitleState ? state.error : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4))),
                );
              },
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            BlocBuilder<AddPostBloc, AddPostState>(
              builder: (context, state) {
                return TextField(
                  controller: bodyController,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    BlocProvider.of<AddPostBloc>(context)
                        .add(AddPostTextChangeBodyEvent(bodyController.text));
                  },
                  decoration: InputDecoration(
                      labelText: "Enter Body",
                      errorText:
                          state is AddPostErrorBodyState ? state.error : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4))),
                );
              },
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            BlocConsumer<AddPostBloc, AddPostState>(
              listener: (context, state) {
                if (state is NoInternetState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("No Internet...!")));
                }else if (state is AddPostSubmittedState) {
                  idController.clear();
                  titleController.clear();
                  bodyController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Post Added Successfully")));
                }
              },
              builder: (context, state) {
                if (state is AddPostLoadingState) {
                  return const CircularProgressIndicator();
                } else {
                  return ElevatedButton(
                      onPressed: () {
                        if (state is! AddPostErrorIdState &&
                            state is! AddPostErrorTitleState &&
                            state is! AddPostErrorBodyState?) {
                          BlocProvider.of<AddPostBloc>(context).add(
                              AddPostSubmitEvent(idController.text,
                                  titleController.text, bodyController.text));
                        } else {}
                      },
                      // : null,
                      child: Text(
                        "Submit",
                        style: StyleConstants.h514PxStyleBold(
                            color: AppColors.white),
                      ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
