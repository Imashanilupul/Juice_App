import 'package:flutter/material.dart';
import 'package:juice_app/app_colors.dart' as appColors;

class UserCart extends StatefulWidget {
  const UserCart({Key? key}) : super(key: key);

  @override
  _UserCartState createState() => _UserCartState();
}

class _UserCartState extends State<UserCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.background,
      appBar: AppBar(
        title: Text("User cart"),
        leading: Icon(
          Icons.shopping_cart,
          size: 32,
          color: appColors.buttons_col,
        ),
        titleTextStyle: TextStyle(
          color: appColors.buttons_col,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Center(
        child: Text("This is a user cart "),
      ),
    );
  }
}
