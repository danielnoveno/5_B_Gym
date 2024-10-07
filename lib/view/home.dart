import 'package:flutter/material.dart';
import 'package:gd_widget2_b_11663/view/view_list.dart';
import 'package:gd_widget2_b_11663/view/isi_home.dart';

// class HomeView extends StatelessWidget { // masukkan ke cennter
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;

//     List imgData = [
//       "images/barbel1.jpg",
//       "images/fit-stats.jpg",
//       "images/health-club.jpg",
//       "images/kekar.jpg",
//       "images/physical.jpg",
//       "images/progress.jpg"
//     ];

//     List dataTitles = [
//       "Alat Olahraga",
//       "Progess",
//       "Kelas Olahraga",
//       "Membership",
//       "Trainer",
//       "Record",
//     ];

//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           // Bungkus dengan SingleChildScrollView
//           child: SingleChildScrollView(
//             child: Container(
//               color: Color(0xFFFC8500),
//               width: width,
//               child: Column(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(),
//                     height: height * 0.25,
//                     width: width,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             top: 30,
//                             left: 20,
//                             right: 20,
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               InkWell(
//                                 onTap: () {},
//                                 child: const Icon(
//                                   Icons.sort,
//                                   color: Colors.white,
//                                   size: 40,
//                                 ),
//                               ),
//                               Container(
//                                 height: 50,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30),
//                                     color: Colors.white,
//                                     image: DecorationImage(
//                                       image: AssetImage("images/gym.png"),
//                                     )),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             top: 20,
//                             left: 20,
//                             right: 20,
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Home",
//                                 style: TextStyle(
//                                   fontSize: 30,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w500,
//                                   letterSpacing: 1,
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 "Last Update: 6 Sep 2024",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white70,
//                                   letterSpacing: 1,
//                                 ),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SingleChildScrollView(
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(50),
//                           topRight: Radius.circular(50),
//                         ),
//                       ),
//                       width: width,
//                       padding: EdgeInsets.symmetric(),
//                       child: Padding(
//                         padding: const EdgeInsets.only(bottom: 20),
//                         child: GridView.builder(
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             childAspectRatio: 1.1,
//                             mainAxisSpacing: 25,
//                           ),
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: imgData.length,
//                           itemBuilder: (context, index) {
//                             return InkWell(
//                               onTap: () {},
//                               child: Container(
//                                 margin: EdgeInsets.symmetric(
//                                     vertical: 8, horizontal: 20),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black26,
//                                       spreadRadius: 1,
//                                       blurRadius: 6,
//                                     ),
//                                   ],
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Image.asset(
//                                       imgData[index],
//                                       width: 100,
//                                     ),
//                                     Text(
//                                       dataTitles[index],
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //home dart
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
    const HomeViewContent(), // masukkan disini
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
