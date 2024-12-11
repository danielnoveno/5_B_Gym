import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_pbp_gym/entitiy/Cart.dart';
// import 'package:tubes_pbp_gym/models/items_cart.dart';
import 'package:tubes_pbp_gym/view/Payment/invoice.dart';
import 'package:tubes_pbp_gym/providers/cart_provider.dart';
// import 'package:tubes_pbp_gym/entitiy/Cart.dart';

class PaymentMenunggu extends StatelessWidget {
  final String totalFormatted;

  PaymentMenunggu({required this.totalFormatted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      body: Payment(totalFormatted: totalFormatted),
    );
  }
}

class Payment extends StatefulWidget {
  final String totalFormatted;

  Payment({required this.totalFormatted});

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late String _countdown;
  late Timer _timer;
  int _secondsRemaining = 60 * 60 * 24; // 1 day in seconds

  @override
  void initState() {
    super.initState();
    _countdown = _formatTime(_secondsRemaining);
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
          _countdown = _formatTime(_secondsRemaining);
        });
      } else {
        _timer.cancel();
      }
    });
  }

  String _formatTime(int seconds) {
    int hours = (seconds / 3600).floor();
    int minutes = ((seconds % 3600) / 60).floor();
    int remainingSeconds = seconds % 60;

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Color(0xFF0A0A0A)),
            child: Stack(
              children: [
                // Back Button
                Positioned(
                  left: 25,
                  top: 25,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back safely
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, color: Colors.white),
                        const SizedBox(width: 10),
                        Text(
                          'Kembali',
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
                // Main Container
                Positioned(
                  left: 29,
                  top: 119,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 58,
                    height: MediaQuery.of(context).size.height - 120,
                    decoration: ShapeDecoration(
                      color: Color(0xFF673296),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(34),
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Background Circle
                        Positioned(
                          left: -159,
                          top: -137,
                          child: Opacity(
                            opacity: 0.20,
                            child: Container(
                              width: 717,
                              height: 1130,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF502674),
                              ),
                            ),
                          ),
                        ),
                        // Payment Instructions
                        Positioned(
                          left: 20,
                          top: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cara membayar dengan BRI',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '1. Masuk Aplikasi BRI Mobile dan pilih \n   BRI Mobile Banking.\n'
                                '2. Pilih informasi menu.\n'
                                '3. Pilih BRIVA menu.\n'
                                '4. Masukkan nomor Virtual Account \n   (Bank) dari halaman order.\n'
                                '5. Kamu akan menerima notifikasi pesan \n    dari SMS.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Payment Details
                        Positioned(
                          left: 30,
                          top: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Menunggu Pembayaran',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                widget.totalFormatted,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Timer
                        Positioned(
                          left: 30,
                          top: 80,
                          child: Row(
                            children: [
                              Text(
                                'Berakhir dalam',
                                style: TextStyle(
                                  color: Color(0xFFBABABA),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: ShapeDecoration(
                                  color: Color(0xFF4B0C83),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                                child: Text(
                                  _countdown,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Payment Details Box
                        Positioned(
                          left: 12,
                          right: 12,
                          top: 130,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: ShapeDecoration(
                              color: Colors.white.withOpacity(0.8),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFFE2E2E2)),
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/Payment/BRI.jpg",
                                  width: 61,
                                  height: 21,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '14107 0678  2442 23',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF9F96A5),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.copy, color: Colors.white),
                                      const SizedBox(width: 9),
                                      Text(
                                        'Copy',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // "Lihat Order" Button
                        Positioned(
                          left: 25,
                          right: 25,
                          bottom: 20,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF4B0C83),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            onPressed: () {
                              final cartProvider = Provider.of<CartProvider>(
                                  context,
                                  listen: false);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (c) => PdfInvoicePage(
                                    cartItems: convertToCartItems(
                                        cartProvider.cartItems),
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Lihat Order',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

convertToCartItems(List<CartItem> cartItems) {}
