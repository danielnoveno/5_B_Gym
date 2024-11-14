import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 430,
        height: 932,
        decoration: BoxDecoration(color: Color(0xFF0A0A0A)),
        child: Stack(
          children: [
            Positioned(
              left: 24,
              top: 104,
              child: Container(
                width: 382,
                height: 798,
                padding: EdgeInsets.symmetric(horizontal: 67, vertical: 34),
                decoration: ShapeDecoration(
                  color: Color(0xFF673296),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 139,
                      height: 191.28,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Container(
                              width: 139,
                              height: 127.52,
                              decoration: ShapeDecoration(
                                color: Colors.black.withOpacity(0.08),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 63.76,
                            child: Container(
                              width: 139,
                              height: 127.52,
                              decoration: ShapeDecoration(
                                color: Colors.black.withOpacity(0.08),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Total yang harus dibayarkan:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
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
                    SizedBox(height: 12),
                    Text(
                      'Metode Pembayaran:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    buildPaymentOption('E-Wallet'),
                    SizedBox(height: 12),
                    buildPaymentOption('Virtual Account'),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 66,
              top: 829,
              child: Container(
                width: 298,
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
            Positioned(
              left: 25,
              top: 25,
              child: Row(
                children: [
                  FlutterLogo(size: 24),
                  SizedBox(width: 10),
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
          ],
        ),
      ),
    );
  }

  Widget buildPaymentOption(String text) {
    return Container(
      width: 298,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 7),
      decoration: ShapeDecoration(
        color: Color(0xFF29123E),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          FlutterLogo(size: 24),
        ],
      ),
    );
  }
}
