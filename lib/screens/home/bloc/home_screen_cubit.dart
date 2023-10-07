import 'package:bloc_demo_api/constants/url_constants.dart';
import 'package:bloc_demo_api/models/network/users_model.dart';
import 'package:bloc_demo_api/network/base_client.dart';
import 'package:bloc_demo_api/network/exception.dart';
import 'package:bloc_demo_api/screens/home/bloc/home_screen_states.dart';
import 'package:bloc_demo_api/utils/reachability.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenState>{
  HomeScreenCubit(): super(HomeScreenInitState()){
    getAllUsers();
  }
  List<UsersModel>? userList;



  getAllUsers()async{
    userList?.clear();
    if (await Reachability.isInternetAvailable() == true) {
      emit(HomeScreenLoadingState());
      getUsers().then((value) {
        userList = value;
        emit(HomeScreenLoadedState(userList!));
      }).onError((error, stackTrace){
        emit(HomeScreenErrorState(FetchException(error).fetchErrorModel().toString()));
      });
    }else{
      emit(NoInternetState());
    }
  }


  Future<List<UsersModel>> getUsers() {
    return BaseClient.instance
        .get(UrlConstants.users)
        .then((value) => usersModelFromJson(value));
  }

}