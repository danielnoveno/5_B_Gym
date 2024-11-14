import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/beranda/card_membership/solo.dart'; // Importing the PackageCard

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.black, // Set the background color of the entire page to black
      appBar: AppBar(
        title: Text(
          "GROUP",
          style: TextStyle(color: Colors.white), // Make the title white
        ),
        centerTitle: true,
        backgroundColor: Colors.black, // Set the app bar background to black
        iconTheme:
            IconThemeData(color: Colors.white), // Set the back icon to white
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Wrap the body in a SingleChildScrollView to allow scrolling
          child: Column(
            children: [
              PackageCard(
                duration: "30 Hari",
                price: "Rp 1.000.000/bulan",
                total: "Rp 1.000.000",
                details: [
                  "Akses penuh untuk 4 orang ke gym dan fasilitas",
                  "Tidak ada sesi personal trainer",
                ],
              ),
              PackageCard(
                duration: "12 Bulan",
                price: "Rp 10.800.000/bulan",
                total: "Rp 10.800.000",
                details: [
                  "Akses penuh untuk 4 orang ke gym dan fasilitas",
                  "Dua sesi personal trainer per-orang",
                  "Potongan harga satu bulan",
                ],
              ),
              PackageCard(
                duration: "24 Bulan",
                price: "Rp 19.200.000/bulan",
                total: "Rp 19.200.000",
                details: [
                  "Akses penuh untuk 4 orang ke gym dan fasilitas",
                  "Dua sesi personal trainer per-orang",
                  "Potongan harga 20%",
                  "Akses gratis ke semua kelas selama 1 minggu setiap 6 bulan",
                  "Free gym merchandise (towel, bottle, t-shirt)",
                  "Free access fasilitas spa/sauna 1x/bulan per-orang",
                  "Sesi konsultasi nutrisi gratis per orang",
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
