import 'package:flutter/material.dart';
import 'package:juice_app/app_colors.dart';

class UserCart extends StatefulWidget {
  const UserCart({Key? key}) : super(key: key);

  @override
  _UserCartState createState() => _UserCartState();
}

class _UserCartState extends State<UserCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User cart"),
      ),
      body: Container(
        child: Text("This is a user cart "),
      ),
    );
  }
}
