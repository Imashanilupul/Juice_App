import 'dart:math';

import 'package:flutter/material.dart';
import 'package:juice_app/app_colors.dart' as appColors;

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.background,
      appBar: AppBar(
        title: Text("User profile"),
        leading: Icon(
          Icons.account_circle_rounded,
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
        child: Text("This is a profile page"),
      ),
    );
  }
}
