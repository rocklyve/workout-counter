import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

@RoutePage()
class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Feed Page'),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
