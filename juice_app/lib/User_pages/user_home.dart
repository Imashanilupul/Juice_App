import 'package:flutter/material.dart';
import 'package:juice_app/app_colors.dart' as appColors;
import 'package:juice_app/User_pages/user_profile.dart' as usrProfile;
import 'package:juice_app/User_pages/user_cart.dart' as usrCart;

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text("Home page"),
    usrCart.UserCart(),
    usrProfile.UserProfile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.background,
      appBar: _selectedIndex == 0
          ? AppBar(
              title: const TextField(
                decoration: InputDecoration(
                  labelText: "Search...",
                  suffixIcon: Icon(Icons.search),
                  alignLabelWithHint: false,
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      gapPadding: BorderSide.strokeAlignCenter,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
            )
          : null,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 100,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: BottomNavigationBar(
            backgroundColor: appColors.buttons_col,
            items: const <BottomNavigationBarItem>[
              // Home icon
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),

              // Shopping cart item
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: 'Cart',
              ),

              // Profile icon
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_rounded,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            selectedIconTheme: const IconThemeData(
              size: 32,
              applyTextScaling: true,
            ),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
