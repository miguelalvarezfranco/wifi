import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'wifi_event.dart';
part 'wifi_state.dart';

class WifiBloc extends Bloc<WifiEvent, WifiState> {
  final Connectivity _conectivity = Connectivity();

  StreamSubscription? connectivtySubscription;

  WifiBloc() : super(WifiInitial()) {
    on<WifiConnectedEvent>((event, emit) {
      emit(WifiConnectedState());
    });
    on<WifiDisconnectedEvent>((event, emit) {
      emit(WifiDisconnectedState());
    });

    connectivtySubscription = _conectivity.onConnectivityChanged.listen((result){
      if(result == ConnectivityResult.wifi){
        add(WifiConnectedEvent());
      }else{
        add(WifiDisconnectedEvent());
      }
    });
  }
}
