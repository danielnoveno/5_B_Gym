import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/profile.dart';
import 'package:tubes_pbp_gym/view/isi_home.dart';
import 'package:tubes_pbp_gym/view/latihan.dart';
import 'package:tubes_pbp_gym/view/jadwal/jadwal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomeViewContent(), // Beranda
      TrainingPage(onNavigate: _onItemTapped), // Latihan
      Jadwal(), // Jadwal
      ProfileView(), // Akun
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: Color(0xFF222222),
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("icons/icons-home/beranda.png"),
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("icons/icons-home/latihan.png"),
              ),
              label: 'Latihan',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("icons/icons-home/jadwal.png"),
              ),
              label: 'Jadwal',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("icons/icons-home/akun.png"),
              ),
              label: 'Akun',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Color(0xFF673296),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
