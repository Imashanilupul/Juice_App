import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fresh Juice Juice",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(0, 255, 102, 255),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(100, 255, 102, 255),
          title: Text(
            "Fresh Juice App",
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}
