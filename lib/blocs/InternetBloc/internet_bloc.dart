import 'dart:async';

import 'package:bloc_demo_api/blocs/InternetBloc/internet_event.dart';
import 'package:bloc_demo_api/blocs/InternetBloc/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvents, InternetState>{

  final Connectivity _connectivity = Connectivity();
  StreamSubscription? internetSubscription;

  InternetBloc() : super(InternetInitState()){
    on<InternetConnectedEvent>((event, emit) => emit(InternetConnectedState()));
    on<InternetNotConnectedEvent>((event, emit) => emit(InternetNotConnectedState()));

    internetSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        add(InternetConnectedEvent());
      }else{
        add(InternetNotConnectedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    internetSubscription?.cancel();
    return super.close();
  }

}