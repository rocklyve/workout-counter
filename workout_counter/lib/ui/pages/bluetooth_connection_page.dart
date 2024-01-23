import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/blocs/bluetoothConnector/bluetooth_connection_cubit.dart';
import '../../domain/blocs/bluetoothConnector/bluetooth_connection_state.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/device_list.dart';

@RoutePage()
class BluetoothConnectionPage extends StatelessWidget {
  const BluetoothConnectionPage({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    print('refresh');
    context.read<BluetoothConnectionCubit>().startObserving();
  }

  void _bleListener(BuildContext context, BluetoothConnectionState state) {
    // print('current state: $state');
    if (state is BluetoothConnectionStateError) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text(state.message)),
      // );
    }
  }

  void _closeButtonPressed(BuildContext context) {
    context.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    print('BluetoothConnectionPage build');

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'BLE Connection',
      ),
      body: BlocConsumer<BluetoothConnectionCubit, BluetoothConnectionState>(
        listener: _bleListener,
        builder: (context, state) {
          if (state is BluetoothConnectionStateConnected ||
              (state is BluetoothConnectionStateObserving && state.devices.isEmpty)) {
            RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: const Center(
                child: Text('Connected to device'),
              ),
            );
          }

          if (state is BluetoothConnectionStateDataReceived) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Connected to device'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _closeButtonPressed(context);
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => _onRefresh(context),
            child: DeviceList(cubit: context.read<BluetoothConnectionCubit>()),
          );
        },
      ),
    );
  }
}
