import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_pbp_gym/models/items_cart.dart';
import 'package:tubes_pbp_gym/providers/cart_provider.dart';
import 'package:tubes_pbp_gym/entitiy/HealthyClub.dart';
import 'package:tubes_pbp_gym/view/beranda/cart/cart.dart';

class HealthyClubUnlimited extends StatelessWidget {
  final KelasOlahragas kelasOlahraga;

  // Constructor to accept a KelasOlahraga object
  HealthyClubUnlimited({required this.kelasOlahraga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          kelasOlahraga.judul, // Use dynamic title
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF2B2B2B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      kelasOlahraga.imagePath, // Use dynamic image path
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    kelasOlahraga.harga, // Use dynamic price
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(height: 8),
                  // List features dynamically
                  ...kelasOlahraga.deskripsi
                      .map((feature) => FeatureItem(text: feature))
                      .toList(),
                  // List available classes dynamically
                  ...kelasOlahraga.kelas
                      .map((className) => FeatureItem(text: className))
                      .toList(),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF673296),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        // Assuming you want to add the first available class
                        final selectedClass = kelasOlahraga.kelas[0];

                        // Create CartItem to be added to the cart
                        final cartItem = CartItem(
                          title: selectedClass,
                          price: parsePrice(kelasOlahraga.harga),
                          image: kelasOlahraga.imagePath,
                          membershipTitle:
                              'Healthy Club ${kelasOlahraga.judul}',
                          type: CartItemType.healthy_club,
                        );

                        // Add to cart using Provider
                        Provider.of<CartProvider>(context, listen: false)
                            .addItem(cartItem);

                        // Show Snackbar for confirmation
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Healthy Club ${kelasOlahraga.judul} berhasil ditambahkan ke keranjang!',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'Lihat Keranjang',
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                      child: Text('Masukan Keranjang',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double parsePrice(String price) {
    String cleanPrice = price.replaceAll(RegExp(r'[^0-9]'), '');
    return double.tryParse(cleanPrice) ?? 0.0;
  }
}

// Define FeatureItem widget
class FeatureItem extends StatelessWidget {
  final String text;

  const FeatureItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Color(0xFF673296), size: 20),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
