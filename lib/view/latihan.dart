import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/beranda/membersip.dart';
import 'package:tubes_pbp_gym/view/beranda/personal_trainer.dart';
import 'package:tubes_pbp_gym/view/beranda/healthy_club.dart';
import 'package:tubes_pbp_gym/view/beranda/alat_gym.dart';

class TrainingPage extends StatefulWidget {
  final Function(int) onNavigate; // Tambahkan callback

  const TrainingPage({super.key, required this.onNavigate});

  @override
  _TrainingPageState createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  int _activeMenuIndex = 0;

  void _navigateToPage(String title) {
    setState(() {
      if (title == 'Membership') {
        _activeMenuIndex = 0;
      } else if (title == 'Personal Trainer') {
        _activeMenuIndex = 1;
      } else if (title == 'Healthy Club') {
        _activeMenuIndex = 2;
      } else if (title == 'Alat Gym') {
        _activeMenuIndex = 3;
      }
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          switch (_activeMenuIndex) {
            case 0:
              return MembershipView();
            case 1:
              return PersonalTrainerView();
            case 2:
              return HealthyClubView();
            case 3:
              return GymEquipmentView();
            default:
              return const Center(
                child: Text('Halaman tidak ditemukan'),
              );
          }
        },
      ),
    );
  }

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
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSection(
            title: 'Membership',
            subtitle: 'Paket tidak ditemukan',
            content: _buildEmptyCardWithImage(
              context: context,
              title: 'Membership',
              subtitle: 'Mulai Sekarang',
              imagePath: 'images/logo-dumbel.png',
              buttonText: 'Pilih Paket',
            ),
          ),
          _buildSection(
            title: 'Personal Trainer',
            subtitle: 'Paket tidak ditemukan',
            content: _buildEmptyCardWithImage(
              context: context,
              title: 'Personal Trainer',
              subtitle: 'Mulai Sekarang',
              imagePath: 'images/logo-dumbel.png',
              buttonText: 'Pilih Paket',
            ),
          ),
          _buildSection(
            title: 'Healthy Club',
            subtitle: 'Paket tidak ditemukan',
            content: _buildEmptyCardWithImage(
              context: context,
              title: 'Healthy Club',
              subtitle: 'Mulai Sekarang',
              imagePath: 'images/logo-dumbel.png',
              buttonText: 'Pilih Paket',
            ),
          ),
          _buildSection(
            title: 'Alat Gym',
            subtitle: 'Alat gym tidak ditemukan',
            content: _buildEmptyCardWithImage(
              context: context,
              title: 'Alat Gym',
              subtitle: 'Mulai Sekarang',
              imagePath: 'images/logo-dumbel.png',
              buttonText: 'Pilih Alat',
            ),
          ),
        ],
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
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          content,
        ],
      ),
    );
  }

  Widget _buildEmptyCardWithImage({
    required BuildContext context,
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
                        onTap: () => _navigateToPage(title),
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
              onPressed: () => _navigateToPage(title),
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
