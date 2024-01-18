import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/blocs/bluetoothConnector/bluetooth_connection_cubit.dart';
import '../../domain/blocs/bluetoothConnector/bluetooth_connection_state.dart';

class DeviceList extends StatelessWidget {
  final BluetoothConnectionCubit cubit;

  const DeviceList({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BluetoothConnectionCubit, BluetoothConnectionState>(
      builder: (context, state) {
        if (state is BluetoothConnectionStateObserving) {
          return ListView.builder(
            itemCount: state.devices.length,
            itemBuilder: (context, index) {
              final device = state.devices[index];

              return ListTile(
                title: Text(device.name),
                subtitle: Text(device.id),
                onTap: () => cubit.connectToDevice(device.id),
              );
            },
          );
        } else if (state is BluetoothConnectionStateConnecting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BluetoothConnectionStateConnected) {
          return const Center(
            child: Text('Connected to device'),
          );
        } else if (state is BluetoothConnectionStateDisconnected) {
          return const Center(
            child: Text('Disconnected from device'),
          );
        } else if (state is BluetoothConnectionStateError) {
          return const Center(
            child: Text('Error'),
          );
        } else if (state is BluetoothConnectionStateDataReceived) {
          return const Center(
            child: Text('Connected and data received'),
          );
        } else {
          return const Center(
            child: Text('Unknown state'),
          );
        }
      },
    );
  }
}
