import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_counter/domain/blocs/bluetoothConnector/bluetooth_connection_cubit.dart';

import '../../domain/blocs/bluetoothConnector/bluetooth_connection_state.dart';
import 'bluetooth_connection_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          BlocBuilder<BluetoothConnectionCubit, BluetoothConnectionState>(
            builder: (context, state) {
              IconData iconData = Icons.bluetooth;
              if (state is BluetoothConnectionStateConnected) {
                iconData = Icons.bluetooth_connected;
              } else if (state is BluetoothConnectionStateConnecting) {
                iconData = Icons.bluetooth_searching;
              } else if (state is BluetoothConnectionStateDisconnected) {
                iconData = Icons.bluetooth_disabled;
              }
              // Add more conditions based on your states

              return IconButton(
                icon: Icon(iconData),
                onPressed: () {
                  context.read<BluetoothConnectionCubit>().startObserving();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BluetoothConnectionPage()),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}
