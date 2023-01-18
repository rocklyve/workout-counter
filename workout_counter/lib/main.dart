import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_counter/ui/pages/app.dart';
import 'package:workout_counter/ui/pages/home_page.dart';
import 'package:workout_counter/utils/environment.dart';
import 'package:workout_counter/utils/print.dart';

import 'environment_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const environment = EnvironmentData(
    appTitle: 'Workout Counter',
    appVersion: '1.0',
  );

  await runMain(environment);
}

Future<void> runMain(EnvironmentData environment) async {
  // Debug printing.
  debugPrint = kDebugMode ? debugPrintThrottled : debugPrintNoOp;

  // Debug tools.
  if (kDebugMode) {
    EquatableConfig.stringify = true;
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // final database = Database();
  // await database.open(filename: environment.databasePath);

  // App execution
  runZonedGuarded<void>(
        () => runApp(
      Environment(
        data: environment,
        child: const App(),
      ),
    ),
    dartErrorToDebugPrint,
    zoneSpecification: const ZoneSpecification(
      print: kDebugMode ? null : zonePrintNoOp,
    ),
  );
}