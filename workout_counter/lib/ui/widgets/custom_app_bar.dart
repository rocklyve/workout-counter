import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final List<Widget>? actions;

  const CustomAppBar({
    Key? key,
    this.title = '',
    this.actions,
  })  : preferredSize = const Size.fromHeight(56.0), // Default AppBar height
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
      actions: actions,
      foregroundColor: Colors.purple[800],
    );
  }
}
