import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/data/membership_data.dart';
import 'package:tubes_pbp_gym/models/membership_package.dart';
import 'package:tubes_pbp_gym/models/items_cart.dart';
import 'package:tubes_pbp_gym/view/beranda/cart/cart.dart';
import 'package:provider/provider.dart';
import 'package:tubes_pbp_gym/providers/cart_provider.dart';

class CouplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        title: Text(
          "COUPLE",
          style: TextStyle(color: Colors.white), // Set title color to white
        ),
        centerTitle: true,
        backgroundColor: Colors.black, // Set the app bar background to black
        iconTheme:
            IconThemeData(color: Colors.white), // Set icon color to white
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: couplePackages.map((package) {
              return PackageCard(
                package: package,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final MembershipPackage package;

  PackageCard({required this.package});

  @override
  Widget build(BuildContext context) {
    // Function to parse the price string into a double
    double parsePrice(String price) {
      // Remove 'Rp' and other non-numeric characters, then parse as double
      String cleanPrice = price.replaceAll(RegExp(r'[^0-9]'), '');
      return double.tryParse(cleanPrice) ?? 0.0;
    }

    return Card(
      color: Color(0xFF2B2B2B), // Set card color
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              package.title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              package.price,
              style: TextStyle(fontSize: 16, color: Colors.grey[400]),
            ),
            SizedBox(height: 8),
            ...package.description.map((detail) => ListTile(
                  leading: Icon(Icons.check_circle_outline,
                      color: Color(0xFF673296)),
                  title: Text(detail, style: TextStyle(color: Colors.white)),
                )),
            SizedBox(height: 8),
            Text(
              "Total Harga: ${package.total}",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Parse the total price into a double
                final totalPrice = parsePrice(package.total);

                // Create a new CartItem with the extracted total price
                final cartItem = CartItem(
                  title: package.title,
                  price: totalPrice, // Use the parsed total price
                  image: 'images/home-image/membership/couple.png',
                  membershipTitle: 'Membership - Couple ${package.title}',
                  type: CartItemType.membership,
                );

                // Add the item to the cart using CartProvider
                Provider.of<CartProvider>(context, listen: false)
                    .addItem(cartItem);

                // Navigate to the CartPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
              child: Text("Pilih"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF673296),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
