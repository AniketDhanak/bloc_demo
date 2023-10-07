import 'package:bloc_demo_api/models/network/users_model.dart';

abstract  class HomeScreenState{}

class HomeScreenInitState extends HomeScreenState{}
class HomeScreenLoadingState extends HomeScreenState{}
class HomeScreenLoadedState extends HomeScreenState{
  List<UsersModel> userList;
  HomeScreenLoadedState(this.userList);
}

class HomeScreenErrorState extends HomeScreenState{
  String error;
  HomeScreenErrorState(this.error);
}
class NoInternetState extends HomeScreenState{}