import 'package:flutter/material.dart';
import 'package:gd_widget2_b_11663/view/view_list.dart';

//home dart
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

  static List<Widget> _widgetOptions = <Widget>[
    SafeArea(
      child: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 20, left: 15, right: 15, bottom: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF674AEF),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.dashboard,
                    size: 30,
                    color: Colors.white,
                  ),
                  const Text(
                    'Hello, Jhon!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.notifications,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    const ListNamaView(),
    const Center(
      child: Text('Index 3: Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
