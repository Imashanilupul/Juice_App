import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:juice_app/common_screens/auth_screen.dart';
import 'firebase_options.dart';
import 'package:juice_app/app_colors.dart' as appColors;
import 'package:juice_app/User_pages/user_home.dart' as UserHome;
import 'package:juice_app/User_pages/user_sign_up.dart' as usrSignup;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}
