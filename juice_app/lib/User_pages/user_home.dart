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
        title: const TextField(
          autofocus: true,
          decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: "Search...",
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              gapPadding: BorderSide.strokeAlignCenter,
            ),
          ),
        ),
      ),
      body: Text("Hello World"),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: appColors.buttons_col,
        items: const <BottomNavigationBarItem>[
          //H ome icon
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),

          // Shopping cart item
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_shopping_cart,
            ),
            label: 'cart',
          ),

          // Profile icon
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_rounded,
            ),
            label: 'Profile',
          ),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
      ),
    );
  }
}
