import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_counter/domain/blocs/bluetoothConnector/bluetooth_connection_cubit.dart';

import '../../domain/repositories/data_repository.dart';
import '../../domain/repositories/data_repository_impl.dart';
import 'home_page.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DataRepository>(
          create: (context) => DataRepositoryImplementation(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<BluetoothConnectionCubit>(
                create: (context) => BluetoothConnectionCubit(),
                lazy: false,
              ),
            ],
            child: Builder(
              builder: (context) {
                return const MaterialApp(
                  home: HomePage(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
