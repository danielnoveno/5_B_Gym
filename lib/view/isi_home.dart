import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/beranda/membersip.dart';
import 'package:tubes_pbp_gym/view/beranda/personal_trainer.dart';
import 'package:tubes_pbp_gym/view/beranda/healthy_club.dart';
import 'package:tubes_pbp_gym/view/beranda/alat_gym.dart';
import 'package:tubes_pbp_gym/view/beranda/notifikasi.dart';

class HomeViewContent extends StatefulWidget {
  const HomeViewContent({super.key});

  @override
  _HomeViewContentState createState() => _HomeViewContentState();
}

class _HomeViewContentState extends State<HomeViewContent> {
  int _activeMenuIndex = 0;

  // Helper method untuk menampilkan tampilan sesuai kategori yang aktif
  Widget _getViewForActiveMenu() {
    switch (_activeMenuIndex) {
      case 0:
        return MembershipView(); // Menampilkan MembershipView
      case 1:
        return PersonalTrainerView(); // Menampilkan PersonalTrainerView
      case 2:
        return HealthyClubView(); // Menampilkan HealthyClubView
      case 3:
        return GymEquipmentView(); // Menampilkan GymEquipmentView
      default:
        return const Center(child: Text('No View Available'));
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        color: Colors.black,
        width: width,
        child: Column(
          children: [
            // Header Section dengan greeting, icons, dan promotional card
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greeting dan Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Halo, Mariwow!",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Sekecil apapun progressnya tetap progress",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _buildCircleIcon(Icons.notifications, () {
                            // Arahkan ke halaman notifikasi
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationScreen()),
                            );
                          }),
                          const SizedBox(width: 10),
                          _buildCircleIcon(Icons.shopping_cart, () {
                            //
                          }),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Promotional Card
                  Container(
                    width: 382,
                    height: 150,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color(0xFF673296),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Oval shapes in the background
                        Positioned(
                          right: 0,
                          top: -10,
                          child: Container(
                            width: 139,
                            height: 128,
                            decoration: ShapeDecoration(
                              color: Colors.black.withOpacity(0.08),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
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
                        // Content of the card
                        Row(
                          children: [
                            Image.asset(
                              "images/home-image/Crevelone.png",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Pure Creatine",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Tingkatkan repetisimu dengan crevolene",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // Horizontal Scrollable Menu
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildMenuButton("Membership", 0),
                    _buildMenuButton("Personal Trainer", 1),
                    _buildMenuButton("Healthy Club", 2),
                    _buildMenuButton("Alat Gym", 3),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),

            // Menampilkan tampilan sesuai kategori yang dipilih
            Expanded(
              child: _getViewForActiveMenu(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method untuk membuat tombol dengan ikon bundar
  Widget _buildCircleIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color(0xFF673296),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  // Helper method untuk membuat tombol menu dengan state aktif
  Widget _buildMenuButton(String label, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _activeMenuIndex = index; // Set active menu index saat ditekan
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _activeMenuIndex == index
              ? Color(0xFF673296) // Jika aktif, background menjadi ungu
              : Color(
                  0xFF404040), // Jika tidak aktif, background menjadi abu-abu
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
