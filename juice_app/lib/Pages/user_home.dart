import 'package:flutter/material.dart';
import 'package:juice_app/app_colors.dart' as appColors;

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              gapPadding: BorderSide.strokeAlignCenter,
            ),
          ),
        ),
      ),
    );
  }
}
