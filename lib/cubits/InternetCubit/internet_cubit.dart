import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

enum InternetState { connected, init, disconnected }

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? internetSubscription;

  InternetCubit() : super(InternetState.init) {
    internetSubscription = _connectivity.onConnectivityChanged.listen((result) {
      print("ANiket: $result");
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        emit(InternetState.connected);
        print("Connected Aniket");
      } else {
        emit(InternetState.disconnected);
        print("Dis-connected Aniket");
      }
    });
  }

  @override
  Future<void> close() {
    internetSubscription?.cancel();
    return super.close();
  }
}
