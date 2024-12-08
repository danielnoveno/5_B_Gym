import 'package:flutter/material.dart';
// import 'package:tubes_pbp_gym/view/profile.dart';
import 'package:tubes_pbp_gym/view/addreview.dart';


class Riwayat extends StatefulWidget {
  final Map? data;
  const Riwayat({super.key, this.data});

  @override
  State<Riwayat> createState() => _Riwayat();
}

class _Riwayat extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.black,
  title: Text(
    'Riwayat',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  leading: IconButton(
    icon: Icon(
      Icons.arrow_back,
      color: Colors.white, // Arrow color set to white
    ),
    onPressed: () {
      Navigator.pop(context); // Navigate back when the arrow is clicked
    },
  ),
),

      backgroundColor:
          Colors.black, // Adjust if this isn't the desired background color
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SizedBox(
            width: 42.0,
            height: 290.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color.fromARGB(174, 194, 73, 255),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Stack(
                children: [
                  // First inner box
                  Positioned(
                    top: 20,
                    left: 15,
                    child: SizedBox(
                      width: 330,
                      height: 80,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                                150, 200, 200, 200), // Inner box color
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(children: [
                            // Image inside the box
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                'https://via.placeholder.com/330x110', // Replace with your image URL or asset
                                fit: BoxFit.cover,
                                width: 180,
                                height: 110,
                              ),
                            ),
                            // Text overlay
                            Positioned(
                              top: 10, // Vertical position of first text
                              left: 220, // Horizontal position of first text
                              child: Text(
                                'Pesanan', // Replace with your desired text
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            // Text overlay 2
                            Positioned(
                              top: 30, // Vertical position of second text
                              left: 220, // Horizontal position of second text
                              child: Text(
                                '4 Sep 2024', // Replace with your second text
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            // Text overlay 3
                            Positioned(
                              top: 50, // Vertical position of third text
                              left: 220, // Horizontal position of third text
                              child: Text(
                                '22:04 WIB', // Replace with your third text
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ])),
                    ),
                  ),
                  // Second inner box
                  Positioned(
                    top: 125, // Adjust the vertical position
                    left: 15,
                    child: SizedBox(
                      width: 330,
                      height: 150,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(162, 79, 79, 79),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(children: [
                          Positioned(
                            top: 20, // Vertical position of first text
                            left: 15, // Horizontal position of first text
                            child: Text(
                              'Trainer Brandon', // Replace with your desired text
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            top: 50, // Vertical position of first text
                            left: 15, // Horizontal position of first text
                            child: Text(
                              'Total Pembelian', // Replace with your desired text
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 80, // Vertical position of first text
                            left: 15, // Horizontal position of first text
                            child: Text(
                              'Rp. 75.000', // Replace with your desired text
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            top: 20, // Vertical position of first text
                            left: 180, // Horizontal position of first text
                            child: Text(
                              'By : ', // Replace with your desired text
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            top:
                                90, // Adjust this for the vertical positioning of the buttons
                            right: 15, // Positioning from the right side
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .end, // Align buttons to the right
                              children: [
                                ElevatedButton(
                                  onPressed:
                                      () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (c) => const Addreview()));
                                      }, // Add your onPressed function here
                                  child: Text('Review'),
                                ),
                                SizedBox(
                                    width: 5), // Space between the two buttons
                                ElevatedButton(
                                  onPressed:
                                      () {}, // Add your onPressed function here
                                  child: Text('Berhasil'),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 42.0,
            height: 290.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color.fromARGB(174, 194, 73, 255),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Stack(
                children: [
                  // First inner box
                  Positioned(
                    top: 20,
                    left: 15,
                    child: SizedBox(
                      width: 330,
                      height: 80,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                                150, 200, 200, 200), // Inner box color
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(children: [
                            // Image inside the box
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                'https://via.placeholder.com/330x110', // Replace with your image URL or asset
                                fit: BoxFit.cover,
                                width: 180,
                                height: 110,
                              ),
                            ),
                            // Text overlay
                            Positioned(
                              top: 10, // Vertical position of first text
                              left: 220, // Horizontal position of first text
                              child: Text(
                                'Pesanan', // Replace with your desired text
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            // Text overlay 2
                            Positioned(
                              top: 30, // Vertical position of second text
                              left: 220, // Horizontal position of second text
                              child: Text(
                                '12 Des 2024', // Replace with your second text
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            // Text overlay 3
                            Positioned(
                              top: 50, // Vertical position of third text
                              left: 220, // Horizontal position of third text
                              child: Text(
                                '12:04 WIB', // Replace with your third text
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ])),
                    ),
                  ),
                  // Second inner box
                  Positioned(
                    top: 125, // Adjust the vertical position
                    left: 15,
                    child: SizedBox(
                      width: 330,
                      height: 150,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(162, 79, 79, 79),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(children: [
                          Positioned(
                            top: 20, // Vertical position of first text
                            left: 15, // Horizontal position of first text
                            child: Text(
                              'Member Gym Solo 30 Hari', // Replace with your desired text
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            top: 50, // Vertical position of first text
                            left: 15, // Horizontal position of first text
                            child: Text(
                              'Total Pembelian', // Replace with your desired text
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 80, // Vertical position of first text
                            left: 15, // Horizontal position of first text
                            child: Text(
                              'Rp. 300.000', // Replace with your desired text
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            top: 20, // Vertical position of first text
                            left: 290, // Horizontal position of first text
                            child: Text(
                              'By : ', // Replace with your desired text
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            top:
                                90, // Adjust this for the vertical positioning of the buttons
                            right: 15, // Positioning from the right side
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .end, // Align buttons to the right
                              children: [
                                // Space between the two buttons
                                ElevatedButton(
                                  onPressed:
                                      () {}, // Add your onPressed function here
                                  child: Text('Berhasil'),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 42.0,
            height: 290.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color.fromARGB(174, 194, 73, 255),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Stack(
                children: [
                  // First inner box
                  Positioned(
                    top: 20,
                    left: 15,
                    child: SizedBox(
                      width: 330,
                      height: 80,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                                150, 200, 200, 200), // Inner box color
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(children: [
                            // Image inside the box
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                'https://via.placeholder.com/330x110', // Replace with your image URL or asset
                                fit: BoxFit.cover,
                                width: 180,
                                height: 110,
                              ),
                            ),
                            // Text overlay
                            Positioned(
                              top: 10, // Vertical position of first text
                              left: 220, // Horizontal position of first text
                              child: Text(
                                'Pesanan', // Replace with your desired text
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            // Text overlay 2
                            Positioned(
                              top: 30, // Vertical position of second text
                              left: 220, // Horizontal position of second text
                              child: Text(
                                '12 Des 2024', // Replace with your second text
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            // Text overlay 3
                            Positioned(
                              top: 50, // Vertical position of third text
                              left: 220, // Horizontal position of third text
                              child: Text(
                                '12:04 WIB', // Replace with your third text
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ])),
                    ),
                  ),
                  // Second inner box
                  Positioned(
                    top: 125, // Adjust the vertical position
                    left: 15,
                    child: SizedBox(
                      width: 330,
                      height: 150,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(162, 79, 79, 79),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(children: [
                          Positioned(
                            top: 20, // Vertical position of first text
                            left: 15, // Horizontal position of first text
                            child: Text(
                              '4 Sesi', // Replace with your desired text
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            top: 50, // Vertical position of first text
                            left: 15, // Horizontal position of first text
                            child: Text(
                              'Total Pembelian', // Replace with your desired text
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 80, // Vertical position of first text
                            left: 15, // Horizontal position of first text
                            child: Text(
                              'Rp. 250.000', // Replace with your desired text
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            top: 20, // Vertical position of first text
                            left: 200, // Horizontal position of first text
                            child: Text(
                              'By : ', // Replace with your desired text
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            top:
                                90, // Adjust this for the vertical positioning of the buttons
                            right: 15, // Positioning from the right side
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .end, // Align buttons to the right
                              children: [
                                // Space between the two buttons
                                ElevatedButton(
                                  onPressed:
                                      () {}, // Add your onPressed function here
                                  child: Text('Berhasil'),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            )
          )
        ]
      )
    );
  }
}
