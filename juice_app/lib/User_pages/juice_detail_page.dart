import 'package:flutter/material.dart';
import 'package:juice_app/app_colors.dart' as appColors;

class JuiceDetailPage extends StatefulWidget {
  // This page will receive the product data from the home screen
  final Map<String, dynamic> product;

  const JuiceDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _JuiceDetailPageState createState() => _JuiceDetailPageState();
}

class _JuiceDetailPageState extends State<JuiceDetailPage> {
  int _quantity = 1;
  String _selectedSize = 'M'; // Default selected size

  // --- State Management Methods ---

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  void _selectSize(String size) {
    setState(() {
      _selectedSize = size;
    });
  }

  // --- Build Method ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.background,
      appBar: AppBar(
        backgroundColor: appColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Product Image
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(widget.product['image'], fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 20),

            // Quantity Selector
            _buildQuantitySelector(),
            const SizedBox(height: 30),

            // Name and Price
            _buildNameAndPrice(),
            const SizedBox(height: 30),

            // Size Selector
            _buildSizeSelector(),
            const Spacer(), // This pushes the button to the bottom

            // Add to Cart Button
            _buildAddToCartButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets for UI ---

  Widget _buildQuantitySelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove, color: Colors.white, size: 16),
            onPressed: _decrementQuantity,
            splashRadius: 20,
          ),
          Text(
            _quantity.toString().padLeft(2, '0'),
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white, size: 16),
            onPressed: _incrementQuantity,
            splashRadius: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildNameAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.product['name'] ?? 'Cafe Latte',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '\$${widget.product['price']}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSizeSelector() {
    final sizes = ['S', 'M', 'L', 'XL'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: sizes.map((size) => _buildSizeButton(size)).toList(),
    );
  }

  Widget _buildSizeButton(String size) {
    final isSelected = _selectedSize == size;
    return GestureDetector(
      onTap: () => _selectSize(size),
      child: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? appColors.buttons_col : Colors.grey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            size,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${widget.product['name']} added to cart!')),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: appColors.buttons_col,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}