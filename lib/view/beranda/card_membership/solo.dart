import 'package:flutter/material.dart';

class SoloPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("SOLO",
            style:
                TextStyle(color: Colors.white)), // Set the title color to white
        centerTitle: true,
        backgroundColor: Colors.black, // Make the AppBar background black too
        iconTheme: IconThemeData(
            color: Colors.white), // Set the icon color (back button) to white
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Wrap the Column with SingleChildScrollView
          child: Column(
            children: [
              PackageCard(
                duration: "30 Hari",
                price: "Rp 300.000/bulan",
                total: "Rp 3.600.000",
                details: [
                  "Akses penuh ke gym dan fasilitas",
                  "Tidak ada sesi personal trainer",
                ],
              ),
              PackageCard(
                duration: "12 Bulan",
                price: "Rp 275.000/bulan",
                total: "Rp 3.300.000",
                details: [
                  "Akses penuh ke gym dan fasilitas",
                  "Dua sesi personal trainer",
                  "Potongan harga satu bulan",
                ],
              ),
              PackageCard(
                duration: "24 Bulan",
                price: "Rp 270.000/bulan",
                total: "Rp 6.480.000",
                details: [
                  "Akses penuh ke gym dan fasilitas",
                  "Dua sesi personal trainer",
                  "Potongan harga 10%",
                  "Akses gratis ke semua kelas selama 1 minggu setiap 6 bulan",
                  "Free gym merchandise (towel, bottle, t-shirt)",
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final String duration;
  final String price;
  final String total;
  final List<String> details;

  PackageCard(
      {required this.duration,
      required this.price,
      required this.total,
      required this.details});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF2B2B2B), // Set card color to #2B2B2B
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(duration,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)), // White text for duration
            SizedBox(height: 8),
            Text(price,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400])), // Lighter gray for price
            SizedBox(height: 8),
            ...details.map((detail) => ListTile(
                  leading: Icon(Icons.check_circle_outline,
                      color: Color(0xFF673296)),
                  title: Text(detail,
                      style: TextStyle(
                          color: Colors.white)), // White text for details
                )),
            SizedBox(height: 8),
            Text("Total Harga: $total",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)), // White text for total
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text("Pilih"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF673296),
                foregroundColor: Colors.white, // Set button text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
