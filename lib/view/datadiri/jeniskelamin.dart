import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/datadiri/tinggibadan.dart';

class JenisKelamin extends StatefulWidget {
  final Map? data;
  const JenisKelamin({super.key, this.data});

  @override
  State<JenisKelamin> createState() => _JenisKelamin();
}

class _JenisKelamin extends State<JenisKelamin> {
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
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildProgressDot(isActive: true),
                  _buildProgressDot(isActive: false),
                  _buildProgressDot(isActive: false),
                  _buildProgressDot(isActive: false),
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
                          'Apa Jenis Kelamin Anda?',
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
                              _selectedButton = 'Laki-Laki'; // Update selected button
                            });
                          },
                          child: const Text(
                            'Laki-Laki',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _selectedButton == 'Laki-Laki'
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
                              _selectedButton = 'Perempuan'; // Update selected button
                            });
                          },
                          child: const Text(
                            'Perempuan',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _selectedButton == 'Perempuan'
                              ? Colors.grey[700] // Darker when selected
                              : Colors.grey, // Original color
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
                                    builder: (c) => const TinggiBadan()));
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
