import 'package:flutter/material.dart';
import 'package:juice_app/app_colors.dart' as appColors;
import 'package:juice_app/User_pages/user_profile.dart';
import 'package:juice_app/User_pages/user_cart.dart';

// Main UserHome StatefulWidget
class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

// State class for UserHome
class _UserHomeState extends State<UserHome> {
  int _selectedIndex = 0;

  // The list of widgets for each tab. Must be `final`, not `const`.
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePageContent(),
    const UserCart(),
    const UserProfile(),
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
      
      // THIS IS THE CORRECTED APPBAR LOGIC
      appBar: _selectedIndex == 0
          ? AppBar(
              // AppBar for Home page (index 0) with the search bar
              backgroundColor: appColors.background,
              elevation: 0,
              title: const TextField(
                decoration: InputDecoration(
                  labelText: "Search...",
                  suffixIcon: Icon(Icons.search),
                  alignLabelWithHint: false,
                  hintStyle: TextStyle(color: Colors.white70),
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white24),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            )
          : AppBar(
              // A single, shared AppBar for Cart (index 1) and Profile (index 2)
              title: Text(
                _selectedIndex == 1 ? "Cart" : "Profile",
                style: TextStyle(
                  color: appColors.buttons_col,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: appColors.background,
              elevation: 0,
              automaticallyImplyLeading: false, // Removes the back arrow
            ),
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      
      // Your BottomNavigationBar code
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
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
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

//------------------------------------------------------------------
// WIDGET FOR THE HOME PAGE BODY
//------------------------------------------------------------------
class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> products = const [
    {'image': 'assets/images/drink1.jpg', 'price': '30', 'rating': 5},
    {'image': 'assets/images/drink2.jpg', 'price': '25', 'rating': 4},
    {'image': 'assets/images/drink3.jpg', 'price': '50', 'rating': 3},
    {'image': 'assets/images/drink4.jpg', 'price': '53', 'rating': 5},
    {'image': 'assets/images/drink5.jpg', 'price': '45', 'rating': 5},
    {'image': 'assets/images/drink6.jpg', 'price': '23', 'rating': 1},
    {'image': 'assets/images/drink7.jpg', 'price': '35', 'rating': 4},
    {'image': 'assets/images/drink8.jpg', 'price': '40', 'rating': 5},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductItemCard(
          imagePath: product['image'],
          price: product['price'],
          rating: product['rating'],
        );
      },
    );
  }
}

//------------------------------------------------------------------
// WIDGET FOR A SINGLE PRODUCT CARD IN THE GRID
//------------------------------------------------------------------
class ProductItemCard extends StatelessWidget {
  final String imagePath;
  final String price;
  final int rating;

  const ProductItemCard({
    Key? key,
    required this.imagePath,
    required this.price,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 16,
                );
              }),
            ),
            const SizedBox(height: 4),
            Text(
              '\$$price',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}