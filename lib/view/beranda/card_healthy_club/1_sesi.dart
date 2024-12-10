import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/entitiy/HealthyClub.dart';
import 'package:tubes_pbp_gym/client/Healthy_clubClient.dart';
import 'package:provider/provider.dart';
import 'package:tubes_pbp_gym/providers/cart_provider.dart';
import 'package:tubes_pbp_gym/models/items_cart.dart';
import 'package:tubes_pbp_gym/view/beranda/cart/cart.dart';

class HealthyClub1Sesi extends StatefulWidget {
  final int kelasOlahragaId;

  HealthyClub1Sesi({required this.kelasOlahragaId});

  @override
  _HealthyClub1SesiState createState() => _HealthyClub1SesiState();
}

class _HealthyClub1SesiState extends State<HealthyClub1Sesi> {
  late Future<KelasOlahragas> kelasOlahragasFuture;

  @override
  void initState() {
    super.initState();
    // Fetch the KelasOlahragas data using the ID passed in the widget
    kelasOlahragasFuture = KelasOlahragaClient.find(widget.kelasOlahragaId);
  }

  double parsePrice(String price) {
    String cleanPrice = price.replaceAll(RegExp(r'[^0-9]'), '');
    return double.tryParse(cleanPrice) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Kelas Olahraga',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<KelasOlahragas>(
        future: kelasOlahragasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }

          final kelasOlahragas = snapshot.data!;

          return Padding(
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
                        child: Image.network(
                          kelasOlahragas.imagePath,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        kelasOlahragas.harga,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Divider(color: Colors.grey),
                      SizedBox(height: 8),
                      for (var feature in kelasOlahragas.deskripsi)
                        FeatureItem(text: feature),
                      SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: kelasOlahragas.kelas.isNotEmpty
                            ? kelasOlahragas.kelas[0]
                            : null,
                        items: kelasOlahragas.kelas.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          // Handle class selection change
                        },
                        dropdownColor: Color(0xFF2B2B2B),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF673296),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        iconEnabledColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                      ),
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
                            final selectedClass = kelasOlahragas.kelas
                                .firstWhere(
                                    (item) => item == kelasOlahragas.kelas[0]);
                            final cartItem = CartItem(
                              title: selectedClass,
                              price: parsePrice(kelasOlahragas.harga),
                              image: kelasOlahragas.imagePath,
                              membershipTitle:
                                  'Healthy Club 1 Sesi Kelas - $selectedClass',
                              type: CartItemType.healthy_club,
                            );

                            Provider.of<CartProvider>(context, listen: false)
                                .addItem(cartItem);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Healthy Club 1 Sesi Kelas - $selectedClass berhasil ditambahkan ke keranjang!',
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
                          child: Text(
                            'Masukan Keranjang',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

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
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
