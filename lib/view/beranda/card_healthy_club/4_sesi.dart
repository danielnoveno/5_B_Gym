import 'package:flutter/material.dart';

class HealthyClub4Sesi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.black, // Set the background color of the entire page to black
      appBar: AppBar(
        title: Text(
          '4 Sesi',
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
          // Wrap the body in a SingleChildScrollView to allow scrolling
          child: Center(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color:
                    Colors.black87, // Set the background color of the container
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
                      'images/home-image/healthy-club/4-sesi.png',
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Rp 280.000',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Make the price text white
                    ),
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(height: 8),
                  FeatureItem(
                    text: 'Diskon 20.000 dari harga normal per-sesi',
                  ),
                  FeatureItem(
                    text:
                        'Fleksibilitas mengikuti kelas olahraga mana saja dalam waktu 1 bulan',
                  ),
                  FeatureItem(text: 'Zumba'),
                  FeatureItem(text: 'Yoga'),
                  FeatureItem(text: 'HIIT'),
                  FeatureItem(text: 'Spinning'),
                  FeatureItem(text: 'Pilates'),
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
                          style: TextStyle(
                              color: Colors.white)), // Make button text white
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
