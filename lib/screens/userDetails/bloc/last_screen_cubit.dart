import 'package:bloc_demo_api/screens/userDetails/bloc/last_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastScreenCubit extends Cubit<LastScreenState>{
  LastScreenCubit(): super(LastScreenInitState());
}