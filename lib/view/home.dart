import 'package:flutter/material.dart';
import 'package:gd_widget2_b_11663/view/view_list.dart';
<<<<<<< Updated upstream
=======
import 'package:gd_widget2_b_11663/view/isi_home.dart';
>>>>>>> Stashed changes
import 'package:gd_widget2_b_11663/view/profile.dart';

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

<<<<<<< Updated upstream
  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Image(image: NetworkImage('https://picsum.photos/200/100'))),
    ListNamaView(),
    profileView(),
=======
  static List<Widget> _widgetOptions = <Widget>[
    const HomeViewContent(), // masukkan disini
    const ListNamaView(),
    profileView()
>>>>>>> Stashed changes
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: 'List'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
