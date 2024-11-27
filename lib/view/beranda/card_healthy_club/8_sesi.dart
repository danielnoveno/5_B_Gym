import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/models/healthy_club.dart';

class HealthyClub8Sesi extends StatelessWidget {
  final KelasOlahraga kelasOlahraga;

  // Constructor accepting the KelasOlahraga object
  HealthyClub8Sesi({required this.kelasOlahraga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.black, // Set the background color of the entire page to black
      appBar: AppBar(
        title: Text(
          kelasOlahraga.title,
          style: TextStyle(color: Colors.white), // Make the title white
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Make the back icon white
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black, // Set the app bar background to black
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(
                    0xFF2B2B2B), // Set the background color of the container
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      kelasOlahraga.imagePath,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    kelasOlahraga.price,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Make the price text white
                    ),
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(height: 8),
                  // Display features dynamically
                  for (var feature in kelasOlahraga.features)
                    FeatureItem(text: feature),
                  // Display available classes dynamically
                  for (var availableClass in kelasOlahraga.availableClasses)
                    FeatureItem(text: availableClass),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF673296),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('Masukan Keranjang',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String text;

  const FeatureItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Color(0xFF673296), size: 20),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white), // Make the feature text white
            ),
          ),
        ],
      ),
    );
  }
}
