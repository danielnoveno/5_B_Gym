import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/Payment/paymentMenunggu.dart';
import 'package:tubes_pbp_gym/view/beranda/cart/cart.dart';

List<String> Ewallet = ['QRIS', 'OVO', 'Shopee Pay', 'Gopay'];
List<String> VirtualAcc = [
  'BCA Virtual Account',
  'Mandiri Virtual Account',
  'BRIVA',
  'BNI Virtual Account'
];

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedEwallet; // Untuk pilihan E-Wallet
  String? selectedVirtualAcc; // Untuk pilihan Virtual Account

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color(0xFF0A0A0A)),
        child: Stack(
          children: [
            // Header Kiri Atas
            Positioned(
              left: 25,
              top: 25,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      'Pembayaran',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Konten utama
            Positioned(
              left: 24,
              right: 24,
              top: 104,
              bottom: 100,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF673296), // Background ungu
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total yang harus dibayarkan:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Rp 4.640.000',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Metode Pembayaran:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Dropdown untuk E-Wallet
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: DropdownButtonFormField<String>(
                        value: selectedEwallet,
                        dropdownColor: Colors.black.withOpacity(0.8),
                        items: Ewallet.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedEwallet = value;
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'E-Wallet',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          prefixIcon: Icon(Icons.wallet, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Dropdown untuk Virtual Account
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: DropdownButtonFormField<String>(
                        value: selectedVirtualAcc,
                        dropdownColor: Colors.black.withOpacity(0.8),
                        items: VirtualAcc.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedVirtualAcc = value;
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Virtual Account',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          prefixIcon:
                              Icon(Icons.account_balance, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Tombol Bayar Sekarang
            Positioned(
              left: 66,
              right: 66,
              bottom: 30,
              child: GestureDetector(
                onTap: () {
                  if (selectedEwallet == null && selectedVirtualAcc == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Harap pilih metode pembayaran!'),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Lakukan Pembayaran!'),
                    ));
                  }
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => PaymentMenunggu()));
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  decoration: ShapeDecoration(
                    color: Color(0xFF4B0C83),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Bayar Sekarang',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
