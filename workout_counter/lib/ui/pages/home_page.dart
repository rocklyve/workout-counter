import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_counter/domain/blocs/bluetoothConnector/bluetooth_connection_cubit.dart';

import '../../domain/blocs/bluetoothConnector/bluetooth_connection_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BluetoothConnectionCubit, BluetoothConnectionState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      context.read<BluetoothConnectionCubit>().startObserving(),
                  child: const Text('Start Search'),
                ),
                const SizedBox(height: 10),
                if (state is BluetoothConnectionStateLoaded)
                  Text(
                    state.isConnected
                        ? '${state.device?.name ?? 'Unknown device'} is connected'
                        : 'not connected',
                    style: TextStyle(
                      color: state.isConnected ? Colors.green : Colors.red,
                      fontSize: 16,
                    ),
                  ),
                const SizedBox(height: 10),
                if (state is BluetoothConnectionStateLoaded &&
                    state.isConnected)
                  ElevatedButton(
                    onPressed: () => context
                        .read<BluetoothConnectionCubit>()
                        .stopObserving(),
                    child: const Text('disconnect'),
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                      context.read<BluetoothConnectionCubit>().checkout(),
                  child: const Text('checkout services/ characteristics'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
