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

  // The list of widgets for each tab is now updated
  static const List<Widget> _widgetOptions = <Widget>[
    HomePageContent(), // Use the new grid view widget for the home page
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
      // Assuming you have this color defined in your app_colors.dart
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
                        borderRadius: BorderRadius.all(Radius.circular(50)))),
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
            // Assuming you have this color defined in your app_colors.dart
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

//------------------------------------------------------------------
// WIDGET FOR THE HOME PAGE BODY
//------------------------------------------------------------------
class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  // Sample data - replace with your own data from a database or API
  // Make sure you have these images in your `assets/images/` folder
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
      color: Colors.white, // Setting card color to white like in the image
      clipBehavior: Clip.antiAlias, // Ensures the content respects the border radius
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
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

            // Star Rating
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

            // Price
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