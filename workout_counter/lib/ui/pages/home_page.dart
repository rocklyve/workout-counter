import 'package:flutter/material.dart';
import 'package:open_earable/open_earable.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    get_test_print();
    return Container(color: Colors.green);
  }
}
