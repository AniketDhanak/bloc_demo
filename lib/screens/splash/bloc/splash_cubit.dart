import 'package:bloc_demo_api/screens/splash/bloc/splash_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashStates> {
  SplashCubit() : super(SplashInitState()) {
    startTimer();
  }

  startTimer() async {
    Future.delayed(const Duration(seconds: 3), () {
      emit(SplashTimerEndState());
    });
  }
}
