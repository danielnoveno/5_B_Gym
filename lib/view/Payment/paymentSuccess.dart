import 'package:flutter/material.dart';

class PaymentSuccessful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 430, // Sesuaikan dengan lebar yang diinginkan
          height: 932, // Sesuaikan dengan tinggi yang diinginkan
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              // Header "Kembali"
              Container(
                padding: const EdgeInsets.only(top: 40, bottom: 16),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.black),
                    const SizedBox(width: 10),
                    Text(
                      'Kembali',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Lingkaran hijau dengan ikon centang
              Container(
                margin: const EdgeInsets.only(top: 24),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xFF04C17D),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: 72,
                    color: Colors.white,
                  ),
                ),
              ),

              // Teks "Pembayaran berhasil"
              const SizedBox(height: 16),
              Text(
                'Pembayaran berhasil',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Subjudul
              const SizedBox(height: 8),
              Text(
                'Berhasil membayar Rp4.640.000',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              // Informasi transaksi
              const SizedBox(height: 32),
              Expanded(
                child: ListView(
                  children: [
                    buildTransactionRow('Transaksi ID', '4521 1102 5678'),
                    buildTransactionRow('Tanggal', '1 September 2024'),
                    buildTransactionRow('Metode Transaksi', 'BRIVA'),
                    buildTransactionRow('Nominal', 'Rp4.640.000'),
                    buildTransactionRow('Status', 'Success'),
                  ],
                ),
              ),

              // Total pembayaran
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF673296),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp4.640.000',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Tombol Buat Invoice
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Aksi tombol
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Buat Invoice',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.grey[800]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTransactionRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
