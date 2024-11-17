import 'package:flutter/material.dart';

class PaymentSuccessful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Membungkus seluruh konten dengan SingleChildScrollView
        child: Column(
          children: [
            Container(
              width: 430,
              height: 932,
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned(
                    left: 25,
                    top: 25,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, color: Colors.black),
                        const SizedBox(width: 10),
                        Text(
                          'Kembali',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 107,
                    top: 99,
                    child: Row(
                      children: [
                        Container(
                          width: 215,
                          height: 215,
                          decoration: ShapeDecoration(
                            color: Color(0xFF04C17D),
                            shape: CircleBorder(),
                          ),
                        ),
                        const SizedBox(width: 16.8),
                        Container(
                          width: 154.53,
                          height: 154.53,
                          decoration: ShapeDecoration(
                            color: Color(0xFFEFFCF6),
                            shape: OvalBorder(),
                          ),
                        ),
                        const SizedBox(width: 16.8),
                        Icon(Icons.check_circle,
                            size: 72.6, color: Color(0xFF04C17D)),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 70,
                    top: 314,
                    child: Text(
                      'Pembayaran berhasil',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 102,
                    top: 360,
                    child: Text(
                      'Berhasil membayar Rp4.640.000',
                      style: TextStyle(
                        color: Color(0xFF676767),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 458,
                    child: Container(
                      width: 384,
                      child: Column(
                        children: [
                          buildTransactionRow('Transaksi ID', '4521 1102 5678'),
                          buildTransactionRow('Tanggal', '1 September 2024'),
                          buildTransactionRow('Metode Transaksi', 'BRIVA'),
                          buildTransactionRow('Nominal', 'Rp4.640.000'),
                          buildTransactionRow('Status', 'Success'),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 786,
                    child: Container(
                      width: 390,
                      height: 66,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 18),
                      decoration: ShapeDecoration(
                        color: Color(0xFF673296),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Rp4.640.000',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 143,
                    top: 872,
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'Buat Invoice',
                            style: TextStyle(
                              color: Color(0xFF5D5D5D),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.arrow_forward, color: Color(0xFF5D5D5D)),
                        ],
                      ),
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

  Widget buildTransactionRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color(0xFF676767),
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Color(0xFF454545),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
