import 'package:flutter/material.dart';
import 'package:juice_app/app_colors.dart' as appColors;

class UserCart extends StatefulWidget {
  const UserCart({Key? key}) : super(key: key);

  @override
  _UserCartState createState() => _UserCartState();
}

class _UserCartState extends State<UserCart> {
  // Sample data for the cart items.
  // In a real app, this would come from a state management solution.
  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Cafe latte',
      'quantity': 1,
      'price': 4.50,
      'image': 'assets/images/drink1.jpg'
    },
    {
      'name': 'Iced Americano',
      'quantity': 2,
      'price': 3.75,
      'image': 'assets/images/drink3.jpg'
    },
    {
      'name': 'Matcha Latte',
      'quantity': 1,
      'price': 5.25,
      'image': 'assets/images/drink2.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Assuming appColors.background is a dark color like in the screenshot
      backgroundColor: appColors.background, 
      appBar: AppBar(
        // Styling the AppBar to match the screenshot
        title: const Text("Cart"),
        centerTitle: true,
        backgroundColor: appColors.background,
        elevation: 0,
        titleTextStyle: TextStyle(
          // Assuming appColors.buttons_col is a contrasting color (e.g., white or a light blue)
          color: appColors.buttons_col, 
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // The list of cart items
            Expanded(
              child: ListView.builder(
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  final item = _cartItems[index];
                  return _buildCartItemCard(item);
                },
              ),
            ),
            
            // The summary and checkout section
            _buildSummarySection(),
          ],
        ),
      ),
    );
  }

  // Widget for a single item in the cart list
  Widget _buildCartItemCard(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Image
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(item['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),

            // Item Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Quantity : ${item['quantity']}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${item['price'].toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ],
              ),
            ),

            // Remove Button
            IconButton(
              icon: Icon(Icons.remove_circle, color: appColors.buttons_col),
              onPressed: () {
                // Add logic to remove item
                setState(() {
                  _cartItems.removeAt(_cartItems.indexOf(item));
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the bottom summary section
  Widget _buildSummarySection() {
    // In a real app, these values would be calculated from the cart items
    const double subTotal = 21.75;
    const double shipping = 5.00;
    const double total = subTotal + shipping;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          const Divider(thickness: 1),
          const SizedBox(height: 10),
          _buildSummaryRow("Sub Total", "\$${subTotal.toStringAsFixed(2)}"),
          const SizedBox(height: 8),
          _buildSummaryRow("Shipping", "\$${shipping.toStringAsFixed(2)}"),
          const SizedBox(height: 10),
          const Divider(thickness: 1),
          const SizedBox(height: 10),
          _buildSummaryRow(
            "Total",
            "\$${total.toStringAsFixed(2)}",
            isTotal: true,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: appColors.buttons_col,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Check Out",
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Helper widget to create a row in the summary (e.g., "Sub Total" ...... "$XX.XX")
  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: Colors.white70,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}