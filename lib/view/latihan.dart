import 'package:flutter/material.dart';

import 'package:gd_widget2_b_11663/view/beranda/personal_trainer.dart';
import 'package:gd_widget2_b_11663/view/beranda/healthy_club.dart';
import 'package:gd_widget2_b_11663/view/beranda/alat_gym.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const TrainingPage(),
    );
  }
}

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Latihan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black, // Latar belakang hitam
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Membership Section
          _buildSection(
            title: 'Membership',
            subtitle: 'Group - 24 Bulan',
            price: 'Rp19.200.000',
            content: _buildProgressCard(
              title: 'Custom Workout',
              subtitle: 'Lose Weight - Balanced',
              membershipInfo: 'Membership: 24 Bulan',
              remainingMonths: 'Sisa 8 Bulan',
              progressValue: 8 / 24,
            ),
          ),
          // Personal Trainer Section
          _buildSection(
            title: 'Personal Trainer',
            subtitle: 'Paket tidak ditemukan',
            content: _buildEmptyCardWithImage(
              title: 'Belum Ada Paket',
              subtitle: 'Start Now',
              imagePath: 'images/logo-dumbel.png',
              buttonText: 'Pilih Paket',
            ),
          ),
          // Healthy Club Section
          _buildSection(
            title: 'Healthy Club',
            subtitle: 'Paket tidak ditemukan',
            content: _buildEmptyCardWithImage(
              title: 'Belum Ada Paket',
              subtitle: 'Start Now',
              imagePath: 'images/logo-dumbel.png',
              buttonText: 'Pilih Paket',
            ),
          ),
          // Alat Gym section
          _buildSection(
            title: 'Alat Gym',
            subtitle: 'Sewa 3 Alat Gym',
            content: _buildAlatGymcardImage(
              imagePaths: [
                'images/home-image/alat-gym/adjustable-dumbbells.png',
                'images/home-image/alat-gym/resistance-band.png',
                'images/home-image/alat-gym/exercise-mat.png',
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _MembershipCard({
    required String membershipInfo,
    required String remainingMonths,
    required double progressValue,
  }) {
    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding:
            const EdgeInsets.all(16), // Padding untuk seluruh konten dalam Card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              membershipInfo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8), // Jarak antara teks
            Text(
              remainingMonths,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12), // Jarak sebelum LinearProgressIndicator
            Container(
              height: 10, // Tinggi LinearProgressIndicator
              decoration: BoxDecoration(
                color: Colors.grey[800], // Warna latar belakang
                borderRadius: BorderRadius.circular(10), // Border radius
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(10), // Membatasi area indikator
                child: LinearProgressIndicator(
                  value: progressValue,
                  color: const Color(0xFF673296),
                  backgroundColor:
                      Colors.transparent, // Sesuaikan agar mengikuti container
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String subtitle,
    String? price,
    required Widget content,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            if (price != null)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  price,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
          ]),
          const SizedBox(height: 12),
          content,
        ],
      ),
    );
  }

  Widget _buildProgressCard({
    required String title,
    required String subtitle,
    required String membershipInfo,
    required String remainingMonths,
    required double progressValue,
  }) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            color: Color(0xFF673296),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        subtitle,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert, color: Color(0xFF673296)),
                )
              ],
            ),
            _MembershipCard(
                membershipInfo: membershipInfo,
                remainingMonths: remainingMonths,
                progressValue: progressValue),
          ],
        ),
      ),
    );
  }

  Widget _buildAlatGymcardImage({
    required List<String> imagePaths,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Mengatur scroll ke arah horizontal
      child: Row(
        children: imagePaths.map((path) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                width: 140, // Atur lebar card sesuai kebutuhan
                height: 140, // Atur tinggi card sesuai kebutuhan
                child: Image.asset(path,
                    fit: BoxFit.cover), // Menampilkan gambar dalam card
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEmptyCardWithImage({
    required String title,
    required String subtitle,
    required String imagePath,
    required String buttonText,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('images/card.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Pengecekan berdasarkan nilai title
                          if (title == 'Personal Trainer') {
                            // Navigator.push(
                            //   // Menggunakan context yang sudah tersedia
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const PersonalTrainerPage(),
                            //   ),
                            // );
                          } else if (title == 'Healthy Club') {
                            // Navigator.push(
                            //   context, // Menggunakan context yang sudah tersedia
                            //   MaterialPageRoute(
                            //     builder: (context) => const HealthyClubPage(),
                            //   ),
                            // );
                          } else {
                            print('Halaman tidak ditemukan');
                          }
                        },
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Color(0xFF673296),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        child: Text(
                          subtitle,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF673296),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 125),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
