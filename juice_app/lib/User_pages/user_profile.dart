import 'package:flutter/material.dart';
import 'package:juice_app/app_colors.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user profile"),
      ),
      body: Center(
        child: Text("This is a profile page"),
      ),
    );
  }
}
