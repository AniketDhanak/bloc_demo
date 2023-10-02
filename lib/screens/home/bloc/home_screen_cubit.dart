import 'package:bloc_demo_api/screens/home/bloc/home_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenState>{
  HomeScreenCubit(): super(HomeScreenInitState());


}