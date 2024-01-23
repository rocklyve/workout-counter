import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_counter/domain/blocs/bluetoothConnector/bluetooth_connection_cubit.dart';
import 'package:workout_counter/ui/widgets/sensor_data_chart.dart';

import '../../domain/blocs/bluetoothConnector/bluetooth_connection_state.dart';
import '../../domain/models/imu_type.dart';
import '../../routing/router.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/imu_data_chart.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home',
        actions: <Widget>[
          BlocBuilder<BluetoothConnectionCubit, BluetoothConnectionState>(
            builder: (context, state) {
              IconData iconData = Icons.bluetooth;
              if (state is BluetoothConnectionStateConnected) {
                print('state updated: connected');
                iconData = Icons.bluetooth_connected;
              } else if (state is BluetoothConnectionStateConnecting) {
                print('state updated: connecting');
                iconData = Icons.bluetooth_searching;
              } else if (state is BluetoothConnectionStateDisconnected) {
                print('state updated: disconnected');
                iconData = Icons.bluetooth_disabled;
              }
              // Add more conditions based on your states.

              return IconButton(
                icon: Icon(iconData),
                onPressed: () => bleButtonPressed(context),
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
                  Row(
                    children: [
                      Expanded(
                        child: SensorDataChart(
                          objectTempData: state.objectTempData,
                          sensorTempData: state.sensorTempData,
                          sensorIndex: 0,
                        ),
                      ),
                      Expanded(
                        child: SensorDataChart(
                          objectTempData: state.objectTempData,
                          sensorTempData: state.sensorTempData,
                          sensorIndex: 1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SensorDataChart(
                          objectTempData: state.objectTempData,
                          sensorTempData: state.sensorTempData,
                          sensorIndex: 2,
                        ),
                      ),
                      Expanded(
                        child: SensorDataChart(
                          objectTempData: state.objectTempData,
                          sensorTempData: state.sensorTempData,
                          sensorIndex: 3,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SensorDataChart(
                          objectTempData: state.objectTempData,
                          sensorTempData: state.sensorTempData,
                          sensorIndex: 4,
                        ),
                      ),
                      Expanded(
                        child: SensorDataChart(
                          objectTempData: state.objectTempData,
                          sensorTempData: state.sensorTempData,
                          sensorIndex: 5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (state is BluetoothConnectionStateObserving ||
              state is BluetoothConnectionStateDisconnected ||
              state is BluetoothConnectionStateDisconnecting ||
              state is BluetoothConnectionStateInitial ||
              state is BluetoothConnectionStateError) {
            return Center(
              child: Card(
                color: Colors.purple[50],
                elevation: 2.0,
                margin: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(
                        Icons.bluetooth_searching,
                        size: 70.0,
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Connect to BLE Device',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'You first have to connect to the BLE device to start receiving data.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => bleButtonPressed(context),
                        child: const Text('Connect'),
                      ),
                      // Add more information or buttons as needed
                    ],
                  ),
                ),
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void bleButtonPressed(BuildContext context) {
    context.read<BluetoothConnectionCubit>().startObserving();

    context.router.push(const BluetoothConnectionRoute());
  }
}
