import 'package:flutter/material.dart';
import 'package:gd_widget2_b_11663/view/view_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.indigo,
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: height * 0.25,
              width: width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.sort,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        ClipRRect(
                          child: Image.asset(
                            "images/gym.jpg",
                            height: 50,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              height: height * 0.75,
              width: width,
            ),
          ],
        ),
      ),
    );
  }
}


// //home dart
// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   static List<Widget> _widgetOptions = <Widget>[
//     const Center(),
//     const ListNamaView(),
//     const Center(
//       child: Text('Index 3: Profile'),
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list),
//             label: 'List',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//       body: _widgetOptions.elementAt(_selectedIndex),
//     );
//   }
// }
