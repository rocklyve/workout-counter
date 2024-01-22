import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_counter/ui/widgets/custom_app_bar.dart';

@RoutePage()
class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Stats Page'),
      body: Container(),
    );
  }
}
