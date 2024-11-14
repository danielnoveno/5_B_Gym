import 'package:flutter/material.dart';

import 'package:tubes_pbp_gym/view/beranda/card_healthy_club/1_sesi.dart';
import 'package:tubes_pbp_gym/view/beranda/card_healthy_club/4_sesi.dart';
import 'package:tubes_pbp_gym/view/beranda/card_healthy_club/8_sesi.dart';
import 'package:tubes_pbp_gym/view/beranda/card_healthy_club/unlimited.dart';

class HealthyClubView extends StatelessWidget {
  HealthyClubView({super.key});

  // Data untuk gambar, judul, dan durasi
  final List<List<String>> imgDataList = [
    [
      "images/home-image/healthy-club/1-sesi.png",
      "images/home-image/healthy-club/4-sesi.png",
      "images/home-image/healthy-club/8-sesi.png",
      "images/home-image/healthy-club/unlimited-1bulan.png",
    ],
  ];

  final List<List<String>> dataTitlesList = [
    ["Healthy Club 1", "Healthy Club 2", "Healthy Club 3", "Healthy Club 4"],
  ];

  final List<List<String>> dataDurationsList = [
    [
      "Club Membership",
      "Club Membership",
      "Club Membership",
      "Club Membership"
    ],
  ];

  // Fungsi untuk menavigasi ke halaman yang sesuai
  void _navigateToPage(BuildContext context, String title) {
    // Ganti dengan halaman sesuai dengan kebutuhan
    // Misalnya, jika title adalah "Healthy Club 1", arahkan ke halaman lain
    switch (title) {
      case "Healthy Club 1":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HealthyClub1Sesi()));
        break;
      case "Healthy Club 2":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HealthyClub4Sesi()));
        break;
      case "Healthy Club 3":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HealthyClub8Sesi()));
        break;
      case "Healthy Club 4":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HealthyClubUnlimited()));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: imgDataList.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: imgDataList[index].asMap().entries.map((entry) {
            int i = entry.key;
            String image = entry.value;
            String title = dataTitlesList[index][i];
            String duration = dataDurationsList[index][i];

            return GestureDetector(
              onTap: () {
                _navigateToPage(context, title);
              },
              child: Card(
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                margin: const EdgeInsets.only(bottom: 16),
                child: Stack(
                  children: [
                    // Gambar
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      child: Image.asset(
                        image,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Gradient Transparan
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.9),
                                Colors.black.withOpacity(0.1),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Teks dan Icon Direct
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    duration,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Icon Direct untuk Navigasi
                            GestureDetector(
                              onTap: () {
                                _navigateToPage(context, title);
                              },
                              child: Container(
                                width: 42,
                                height: 42,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFF673296),
                                  shape: OvalBorder(),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'icons/icons-home/direct-intocard.png',
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.contain,
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
            );
          }).toList(),
        );
      },
    );
  }
}
