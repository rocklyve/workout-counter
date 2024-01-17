import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/blocs/bluetoothConnector/bluetooth_connection_cubit.dart';
import '../../domain/blocs/bluetoothConnector/bluetooth_connection_state.dart';
import 'device_list.dart';

class BluetoothConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('BluetoothConnectionPage build');
    return Scaffold(
      appBar: AppBar(
        title: Text('BLE Connection'),
      ),
      body: BlocConsumer<BluetoothConnectionCubit, BluetoothConnectionState>(
        listener: (context, state) {
          // print('current state: $state');
          if (state is BluetoothConnectionStateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is BluetoothConnectionStateConnected ||
              (state is BluetoothConnectionStateObserving && state.devices.isEmpty)) {
            return Center(child: Text('Connected to device'));
          }

          final cubit = context.read<BluetoothConnectionCubit>();
          return RefreshIndicator(
            onRefresh: () async {
              cubit.startObserving();
            },
            child: DeviceList(cubit: cubit),
          );
        },
      ),
    );
  }
}
