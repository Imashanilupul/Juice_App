import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:juice_app/app_colors.dart' as appColors;

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.background,
      appBar: AppBar(
        title: const Text("User profile"),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          ),
        ],
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
      body: const Center(
        child: Text("This is a profile page"),
      ),
    );
  }
}
