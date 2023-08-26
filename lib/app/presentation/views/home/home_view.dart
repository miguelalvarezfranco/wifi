import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wifi_bloc/app/presentation/bloc/wifi/wifi_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: BlocBuilder<WifiBloc, WifiState>(
            builder: (context, State){
              if(State is WifiConnectedState){
                return const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Wifi Connected"),
                    Icon(Icons.wifi, color: Colors.green,)
                  ],
                );
              }else if(State is WifiDisconnectedState){
                return const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Wifi Desconnected"),
                    Icon(Icons.wifi, color: Colors.red,)
                  ],
                );
              }else{
                return const CircularProgressIndicator();
              }
            }
        ),
      ),
    );
  }
}
