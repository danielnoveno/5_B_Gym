import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubes_pbp_gym/view/beranda/review_trainer/index_review.dart';
// import 'package:tubes_pbp_gym/view/profile.dart';
// import 'package:tubes_pbp_gym/data/trainer_data.dart';
// import 'package:tubes_pbp_gym/models/personal_trainer.dart';
// import 'package:tubes_pbp_gym/view/beranda/personal_trainer.dart';

class Addreview extends StatefulWidget {
  final Map? data;
  const Addreview({super.key, this.data});

  @override
  State<Addreview> createState() => _addReview();
}

class _addReview extends State<Addreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Kembali',
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
        body: ListView(padding: const EdgeInsets.all(16.0), children: [
          SizedBox(
              width: 42.0,
              height: 800.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 246, 246),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 40, // Vertical position of first text
                      left: 160, // Horizontal position of first text
                      child: Text(
                        'Brandon Salim Tangan', // Replace with your desired text
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 70, // Vertical position of first text
                      left: 160, // Horizontal position of first text
                      child: Text(
                        '25 tahun', // Replace with your desired text
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 150, // Vertical position of the text
                      left: 160, // Horizontal position of the text
                      child: Row(
                        mainAxisSize: MainAxisSize
                            .min, // Ensures that the Row only takes up as much space as needed
                        children: const [
                          Icon(Icons.chat, color: Colors.purple),
                          SizedBox(width: 4),
                          Text("23", style: TextStyle(color: Colors.purple)),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 180, // Vertical position of the text
                      left: 160, // Horizontal position of the text
                      child: Row(
                          mainAxisSize: MainAxisSize
                              .min, // Ensures that the Row only takes up as much space as needed
                          children: [
                            FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Colors.purple,
                              size: 25,
                            ),
                            Text(
                              " brandon@gmail",
                              style: const TextStyle(
                                  color: Colors.purple, fontSize: 16),
                            ),
                          ]),
                    ),
                    Positioned(
                      top: 260,
                      left: 15,
                      child: SizedBox(
                        width: 330,
                        height: 520,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white, // Inner box color
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.purple, // Border color
                              width: 3.0, // Border width
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align text to the start (left)
                              children: [
                                Text(
                                  'Marioow', // First text
                                  style: TextStyle(
                                    fontSize: 12, // Font size
                                    fontWeight: FontWeight.bold, // Text weight
                                    color: Colors.black, // Text color
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        8), // Space between first text and the line
                                Divider(
                                  // Line after first text
                                  color: Colors.black, // Line color
                                  thickness: 1, // Line thickness
                                  indent: 0, // Left indentation
                                  endIndent: 0, // Right indentation
                                ),
                                SizedBox(
                                    height:
                                        8), // Space between line and second text
                                Text(
                                  'type your review here.....', // Second text
                                  style: TextStyle(
                                    fontSize: 14, // Font size for second text
                                    fontWeight:
                                        FontWeight.normal, // Text weight
                                    color: Colors.black, // Text color
                                  ),
                                ),
                                Expanded(
                                  // Ensure the button is at the bottom
                                  child: Container(),
                                ),
                                ElevatedButton(
                                  // Button at the bottom of the box
                                  onPressed: () {
                                    Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (c) => ReadReview()));
                                  },
                                  child: Text(
                                    'Press Me', // Button text
                                    style: TextStyle(
                                      color:
                                          Colors.white, // Text color is white
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors
                                        .purple, // Set the background color of the button to purple
                                    minimumSize: Size(double.infinity,
                                        50), // Make button wider (infinity width, 50 height)
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // Rounded corners for button
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 20,
                        left: 15,
                        child: SizedBox(
                            width: 130,
                            height: 200,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.grey, // Inner box color
                                borderRadius: BorderRadius.circular(15),
                              ),
                            )))
                  ],
                ),
              ))
        ]));
  }
}
