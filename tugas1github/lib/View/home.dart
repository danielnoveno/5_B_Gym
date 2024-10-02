import 'package:flutter/material.dart';
import 'package:guidedlayout2_1900/View/view_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // selectedIndex berkaitan dengan index halaman pada bottomNavigasi
  int _selectedIndex = 0;

  // Fungsi yang nantinya akan dijalankan setiap menekan menu pada navbar
  void _onItemTapped(int index) {
    // setState berkaitan dengan fungsi untuk menampilkan perubahan kondisi & dalam banyak kasus akan menggunakan ini
    setState(() {
      _selectedIndex = index;
    });
  }

  // Menampung List Widget yang akan ditampilkan sesuai index yang dipilih
  static const List<Widget> _widgetOptions = <Widget>[
    // Index 0
    Center(
      child: Image(image: NetworkImage('https://picsum.photos/200/300')),
    ),
    // Index 1
    ListNamaView(), // Jika Error di comment dulu aja
    // Index 2
    Center(
      child: Text('Index 3: Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting navigasi bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex:
            _selectedIndex, // Parameter yang menampung index dari menu bottomNav
        onTap:
            _onItemTapped, // Menjalankan fungsi _onItemTapped, yang dimana fungsi ini akan mengubah nilai index dan melakukan setState sesuai index
      ),
      // Bagian body dari home berdasarkan List _widgetOptions berdasarkan indeks selectedIndex
      body: _widgetOptions.elementAt(
          _selectedIndex), // Mengubah tampilan widget sesuai nilai selectedIndex
    );
  }
}
