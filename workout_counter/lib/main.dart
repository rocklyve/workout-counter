import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_counter/ui/pages/app.dart';
import 'package:workout_counter/utils/environment.dart';
import 'package:workout_counter/utils/print.dart';

import 'environment_data.dart';

void main() {
  runZonedGuarded<void>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      const environment = EnvironmentData(
        appTitle: 'Workout Counter',
        appVersion: '1.0',
      );

      if (kDebugMode) {
        EquatableConfig.stringify = true;
      }

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      // Initialize other services if needed

      runApp(
        Environment(
          data: environment,
          child: const App(),
        ),
      );
    },
    (error, stack) => print(error), // Replace with your error handling logic
    zoneSpecification: const ZoneSpecification(
      print: kDebugMode ? null : zonePrintNoOp,
    ),
  );
}
