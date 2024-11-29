import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:tubes_pbp_gym/view/datadiri/tujuan.dart';

class BeratBadan extends StatefulWidget {
  final Map? data;
  const BeratBadan({super.key, this.data});

  @override
  State<BeratBadan> createState() => _BeratBadan();
}

class _BeratBadan extends State<BeratBadan> {
  final _formKey = GlobalKey<FormState>();
  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    body: SafeArea(
      child: Column(
        children: [
          // Combine AppBar and progress dots in a single row
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Back button on the left
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                // Progress dots
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildProgressDot(isActive: true),
                    _buildProgressDot(isActive: true),
                    _buildProgressDot(isActive: true),
                    _buildProgressDot(isActive: false),
                  ],
                ),
              ],
            ),
          ),
            // Vertically centered content
            Expanded(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max, // Center within available space
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 60),
                        child: Text(
                          'Berapa Berat Badan Anda?',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey.shade900,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  alignment: Alignment.center,
                  height: 50,
                ),
                Positioned(
                    child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(175, 194, 73, 255),
                    borderRadius: BorderRadius.circular(50),
                  
                  ),
                )),
                Container(
                  alignment: Alignment.center,
                  child: NumberPicker(
                    axis: Axis.horizontal,
                    itemHeight: 45,
                    itemWidth: 45.0,
                    step: 1,
                    selectedTextStyle: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                    ),
                    itemCount: 7,
                    value: _currentValue,
                    minValue: 0,
                    maxValue: 300,
                    onChanged: (v) {
                      setState(() {
                        _currentValue = v;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Text(
                "Berat Badan Anda $_currentValue kg",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
                      const SizedBox(height: 80), // Add spacing between buttons
                      SizedBox(
                        width: 300, // Set uniform width
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => const Tujuan()));
                          },
                          child: const Text(
                            'Lanjut',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(175, 194, 73, 255),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressDot({required bool isActive}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 50, // Set the width to 50
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? const Color.fromARGB(175, 194, 73, 255) : Colors.grey,
        borderRadius: BorderRadius.circular(8), // Apply border radius for rounded corners
      ),
    );
  }
}
