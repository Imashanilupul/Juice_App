import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:juice_app/User_pages/user_home.dart';
import 'package:juice_app/common_screens/sign_in.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user logged in
            if (snapshot.hasData) {
              return UserHome();
            } else {
              return SignIn();
            }
          }),
    );
  }
}
