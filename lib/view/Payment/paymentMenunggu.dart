import 'package:flutter/material.dart';

class PaymentMenunggu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            Payment(),
          ],
        ),
      ),
    );
  }
}

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity, // Menggunakan lebar penuh
          height: MediaQuery.of(context)
              .size
              .height, // Menggunakan tinggi layar penuh
          decoration: BoxDecoration(color: Color(0xFF0A0A0A)),
          child: Stack(
            children: [
              Positioned(
                left: 25,
                top: 25,
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
              Positioned(
                left: 29,
                top: 119,
                child: Container(
                  width: MediaQuery.of(context).size.width -
                      58, // Menyesuaikan dengan lebar layar
                  height: MediaQuery.of(context).size.height -
                      120, // Menyesuaikan dengan tinggi layar
                  decoration: ShapeDecoration(
                    color: Color(0xFF673296),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34),
                    ),
                  ),
                  child: Stack(
                    children: [
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
                      Positioned(
                        left: 20,
                        top: 370,
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
                              '1. Masuk Aplikasi BRI Mobile dan pilih \n    BRI Mobile Banking.\n'
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
                      Positioned(
                        left: 30,
                        top: 49,
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
                              'Rp 4.640.000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 126,
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
                                '23:59:58',
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
                      Positioned(
                        left: 12,
                        right: 12,
                        top: 169,
                        child: Container(
                          width: MediaQuery.of(context).size.width -
                              58, // Menyesuaikan dengan lebar layar
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
                      // Tombol "Lihat Order" dengan margin kiri-kanan 25px
                      Positioned(
                        left: 25,
                        right: 25,
                        bottom: 20, // Menambahkan posisi tombol di bawah
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4B0C83), // Warna ungu
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16), // Padding vertikal untuk tombol
                          ),
                          onPressed: () {},
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
    );
  }
}
