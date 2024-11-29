import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/login.dart';

class Tujuan extends StatefulWidget {
  final Map? data;
  const Tujuan({super.key, this.data});

  @override
  State<Tujuan> createState() => _Tujuan();
}

class _Tujuan extends State<Tujuan> {
  final _formKey = GlobalKey<FormState>();
  String _selectedButton = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Top progress indicator
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
                    _buildProgressDot(isActive: true),
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
                          'Apa Tujuan Fitnes Anda?',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 1),
                      SizedBox(
                        width: 300, // Set uniform width
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedButton = 'Mengurangi Berat Badan'; // Update selected button
                            });
                          },
                          child: const Text(
                            'Mengurangi Berat Badan',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _selectedButton == 'Mengurangi Berat Badan'
                              ? Colors.grey[700] // Darker when selected
                              : Colors.grey,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10), // Add spacing between buttons
                      SizedBox(
                        width: 300, // Set uniform width
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedButton = 'Membentuk Otot'; // Update selected button
                            });
                          },
                          child: const Text(
                            'Membentuk Otot',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _selectedButton == 'Membentuk Otot'
                              ? Colors.grey[700] // Darker when selected
                              : Colors.grey,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10), // Add spacing between buttons
                      SizedBox(
                        width: 300, // Set uniform width
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedButton = 'Hidup Sehat'; // Update selected button
                            });
                          },
                          child: const Text(
                            'Hidup Sehat',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _selectedButton == 'Hidup Sehat'
                              ? Colors.grey[700] // Darker when selected
                              : Colors.grey,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
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
                                    builder: (c) => const LoginView()));
                          },
                          child: const Text(
                            'Masuk',
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
