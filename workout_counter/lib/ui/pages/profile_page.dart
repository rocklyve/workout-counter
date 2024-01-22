import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile Page'),
      body: Container(),
    );
  }
}
