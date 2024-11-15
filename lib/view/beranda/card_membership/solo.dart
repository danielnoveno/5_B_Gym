import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/data/membership_data.dart';
import 'package:tubes_pbp_gym/models/membership_package.dart';
import 'package:tubes_pbp_gym/models/items_cart.dart';
import 'package:tubes_pbp_gym/view/beranda/card_membership/cart/cart.dart';
import 'package:provider/provider.dart';
import 'package:tubes_pbp_gym/providers/cart_provider.dart';

class SoloPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("SOLO", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: soloPackages.map((package) {
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
    return Card(
      color: Color(0xFF2B2B2B),
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
                // Create a new CartItem
                final cartItem = CartItem(
                  package.title,
                  package.total,
                  'images/home-image/membership/solo.png',
                );

                // Get the CartProvider from the context and add the item to the cart
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
