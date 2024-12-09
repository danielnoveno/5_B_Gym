import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:tubes_pbp_gym/data/membership_data.dart';
import 'package:tubes_pbp_gym/models/items_cart.dart';
import 'package:tubes_pbp_gym/providers/cart_provider.dart';
import 'package:tubes_pbp_gym/view/beranda/cart/cart.dart';
import 'package:tubes_pbp_gym/entitiy/JenisMembership.dart';
import 'package:tubes_pbp_gym/client/Jenis_membershipClient.dart';

class SoloPage extends StatefulWidget {
  @override
  _SoloPageState createState() => _SoloPageState();
}

class _SoloPageState extends State<SoloPage> {
  late Future<List<JenisMembership>> _futureMemberships;

  @override
  void initState() {
    super.initState();
    _futureMemberships = JenisMembershipClient.fetchAll();
  }

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
        child: FutureBuilder<List<JenisMembership>>(
          future: _futureMemberships,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("Tidak ada data"));
            } else {
              final soloMemberships = snapshot.data!
                  .where((membership) =>
                      membership.membershipTitle.toLowerCase() == "solo")
                  .toList();

              if (soloMemberships.isEmpty) {
                return Center(
                    child: Text(
                  "Jenis membership SOLO yang ditemukan",
                  style: TextStyle(color: Colors.white),
                ));
              }

              return SingleChildScrollView(
                child: Column(
                  children: soloMemberships.map((membership) {
                    return PackageCard(membership: membership);
                  }).toList(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final JenisMembership membership;

  PackageCard({required this.membership});

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
              membership.type,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            SizedBox(height: 8),
            Text(
              "Harga: \Rp ${membership.price.toStringAsFixed(2)}/bulan",
              style: TextStyle(fontSize: 16, color: Colors.grey[400]),
            ),
            SizedBox(height: 8),
            ...membership.features.map((feature) => ListTile(
                  leading: Icon(Icons.check_circle_outline,
                      color: Color(0xFF673296)),
                  title: Text(feature, style: TextStyle(color: Colors.white)),
                )),
            SizedBox(height: 8),
            Text(
              "Total: ${membership.total}",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add the item to the cart and show the snack bar
                final cartItem = CartItem(
                  title: membership.membershipTitle,
                  price: membership.price,
                  image: 'images/home-image/membership/solo.png',
                  membershipTitle: 'Membership - ${membership.membershipTitle}',
                  type: CartItemType.membership,
                );

                Provider.of<CartProvider>(context, listen: false)
                    .addItem(cartItem);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Membership ${membership.membershipTitle} berhasil ditambahkan ke keranjang!',
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
