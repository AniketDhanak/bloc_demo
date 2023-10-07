import 'dart:developer';

import 'package:bloc_demo_api/constants/url_constants.dart';
import 'package:bloc_demo_api/models/network/add_post_model.dart';
import 'package:bloc_demo_api/network/base_client.dart';
import 'package:bloc_demo_api/network/exception.dart';
import 'package:bloc_demo_api/screens/addPost/bloc/add_post_events.dart';
import 'package:bloc_demo_api/screens/addPost/bloc/add_post_state.dart';
import 'package:bloc_demo_api/utils/reachability.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostBloc extends Bloc<AddPostEvents, AddPostState> {
  AddPostBloc() : super(AddPostInitState()) {
    //id
    on<AddPostTextChangeIdEvent>((event, emit) {
      if (event.id.isEmpty) {
        emit(AddPostErrorIdState("Please enter id"));
      } else {
        emit(AddPostValidState());
      }
    });

    //title
    on<AddPostTextChangeTitleEvent>((event, emit) {
      if (event.title.isEmpty) {
        emit(AddPostErrorTitleState("Please enter Title"));
      } else {
        emit(AddPostValidState());
      }
    });

    //body
    on<AddPostTextChangeBodyEvent>((event, emit) {
      if (event.body.isEmpty) {
        emit(AddPostErrorBodyState("Please enter body"));
      } else {
        emit(AddPostValidState());
      }
    });

    //submit
    on<AddPostSubmitEvent>((event, emit) {
      addPost(event.title, event.body, int.parse(event.id));
    });
  }

  //Function to call post api
  addPost(String title, String body, int uId) async {
    if (await Reachability.isInternetAvailable() == true) {
      emit(AddPostLoadingState());

      AddPostRequestModel requestModel =
          AddPostRequestModel(title: title, body: body, userId: uId);

      addPostsService(requestModel).then((value) {
        AddPostResponseModel responseModel = value;
        emit(AddPostSubmittedState());
        log(responseModel.toString());
      }).onError((error, stackTrace) {
        emit(AddPostErrorState(
            FetchException(error).fetchErrorModel().toString()));
      });
    } else {
      emit(NoInternetState());
    }
  }

  Future<AddPostResponseModel> addPostsService(
      AddPostRequestModel requestModel) {
    return BaseClient.instance
        .post(UrlConstants.addPost, requestModel)
        .then((value) => addPostResponseModelFromJson(value));
  }
}
