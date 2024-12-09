import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/models/healthy_club.dart';
import 'package:provider/provider.dart';
import 'package:tubes_pbp_gym/providers/cart_provider.dart';
import 'package:tubes_pbp_gym/models/items_cart.dart';
import 'package:tubes_pbp_gym/view/beranda/cart/cart.dart';

class HealthyClub1Sesi extends StatefulWidget {
  final KelasOlahraga kelasOlahraga;

  HealthyClub1Sesi({required this.kelasOlahraga});

  @override
  _HealthyClub1SesiState createState() => _HealthyClub1SesiState();
}

class _HealthyClub1SesiState extends State<HealthyClub1Sesi> {
  late String selectedOlahraga;

  @override
  void initState() {
    super.initState();
    selectedOlahraga = widget.kelasOlahraga.availableClasses[0];
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
          widget.kelasOlahraga.title,
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
                      widget.kelasOlahraga.imagePath,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.kelasOlahraga.price,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(height: 8),
                  for (var feature in widget.kelasOlahraga.features)
                    FeatureItem(text: feature),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedOlahraga,
                    items: widget.kelasOlahraga.availableClasses
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedOlahraga = newValue!;
                      });
                    },
                    dropdownColor: Color(0xFF2B2B2B),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF673296),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    iconEnabledColor:
                        Colors.white, // Color of the dropdown icon
                    style: TextStyle(
                        color: Colors.white), // Text color in the dropdown
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
                        final selectedClass = widget
                            .kelasOlahraga.availableClasses
                            .firstWhere((item) => item == selectedOlahraga);
                        final cartItem = CartItem(
                          title: selectedClass,
                          price: parsePrice(widget.kelasOlahraga.price),
                          image: widget.kelasOlahraga.imagePath,
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
