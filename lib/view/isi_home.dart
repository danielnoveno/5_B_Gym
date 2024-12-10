import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/beranda/membersip.dart';
import 'package:tubes_pbp_gym/view/beranda/personal_trainer.dart';
import 'package:tubes_pbp_gym/view/beranda/healthy_club.dart';
import 'package:tubes_pbp_gym/view/beranda/alat_gym.dart';
import 'package:tubes_pbp_gym/view/beranda/notifikasi.dart';
import 'package:tubes_pbp_gym/view/beranda/cart/cart.dart';
import 'package:tubes_pbp_gym/entitiy/Pelanggan.dart';
import 'package:tubes_pbp_gym/client/PelangganClient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewContent extends StatefulWidget {
  final int initialMenuIndex; // Menyimpan nilai menu awal

  const HomeViewContent({super.key, this.initialMenuIndex = 0});

  @override
  _HomeViewContentState createState() => _HomeViewContentState();
}

class _HomeViewContentState extends State<HomeViewContent> {
  late int _activeMenuIndex;
  late Future<Pelanggan> _pelangganFuture; // Future for fetching Pelanggan

  @override
  void initState() {
    super.initState();
    _activeMenuIndex = widget.initialMenuIndex; // Menggunakan nilai dari konstruktor
    _pelangganFuture = _fetchPelanggan(); // Fetch Pelanggan data
  }

  Future<Pelanggan> _fetchPelanggan() async {
    final prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');

    if (userId == null) {
      throw Exception('User  not logged in');
    }

    return await PelangganClient.find(userId);
  }

  Widget _getViewForActiveMenu() {
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<Pelanggan>(
                    future: _pelangganFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData) {
                        return const Center(child: Text('No data available'));
                      }

                      Pelanggan pelanggan = snapshot.data!;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Halo, ${pelanggan.nama}!", // Display username
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Anda berada di: ${[
                                  'Membership',
                                  'Personal Trainer',
                                  'Healthy Club',
                                  'Alat Gym'
                                ][_activeMenuIndex]}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              _buildCircleIcon(Icons.notifications, () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NotificationScreen()),
                                );
                              }),
                              const SizedBox(width: 10),
                              _buildCircleIcon(Icons.shopping_cart, () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartPage()),
                                );
                              }),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 382,
                    height: 150,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF673296),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          top: -10,
                          child: Container(
                            width: 139,
                            height: 128,
                            decoration: ShapeDecoration(
                              color: Colors.black.withOpacity(0.08),
                              shape: const OvalBorder(),
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
                              shape: const OvalBorder(),
                            ),
                          ),
                        ),
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
                  ),
                ],
              ),
            ),
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
            const SizedBox(height: 10),
            Expanded(
              child: _getViewForActiveMenu(),
            ),
          ],
        ),
      ),
    );
  }

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

  Widget _buildMenuButton(String label, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _activeMenuIndex = index;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _activeMenuIndex == index
              ? const Color(0xFF673296)
              : const Color(0xFF404040),
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