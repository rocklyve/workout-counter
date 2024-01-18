import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_counter/domain/blocs/bluetoothConnector/bluetooth_connection_cubit.dart';

import '../../domain/blocs/bluetoothConnector/bluetooth_connection_state.dart';
import '../../domain/models/imu_type.dart';
import '../widgets/imu_data_chart.dart';
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
        title: const Text('Home'),
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
              // Add more conditions based on your states.

              return IconButton(
                icon: Icon(iconData),
                onPressed: bleButtonPressed,
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<BluetoothConnectionCubit, BluetoothConnectionState>(
        builder: (context, state) {
          if (state is BluetoothConnectionStateDataReceived) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  IMUDataChart(dataPoints: state.imuData, title: 'IMU Data (acc)', type: IMUType.acc),
                  IMUDataChart(dataPoints: state.imuData, title: 'IMU Data (gyro)', type: IMUType.gyro),
                  IMUDataChart(dataPoints: state.imuData, title: 'IMU Data (mag)', type: IMUType.mag),
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void bleButtonPressed() {
    context.read<BluetoothConnectionCubit>().startObserving();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BluetoothConnectionPage()),
    );
  }
}
