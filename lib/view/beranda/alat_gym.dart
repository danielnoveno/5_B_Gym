import 'package:flutter/material.dart';

class GymEquipmentView extends StatefulWidget {
  GymEquipmentView({super.key});

  // Daftar gambar dan nama alat gym
  final List<String> imagePaths = [
    "images/home-image/alat-gym/exercise-mat.png",
    "images/home-image/alat-gym/foam-roller.png",
    "images/home-image/alat-gym/weight-vest.png",
  ];

  final List<String> equipmentNames = [
    "Exercise Mat",
    "Foam Roller",
    "Weight Vest",
  ];

  final List<String> equipmentDescriptions = [
    "Comfortable mat for your workout sessions.",
    "Perfect for muscle relaxation and recovery.",
    "Increase intensity with this weight vest.",
  ];

  final List<int> equipmentPrices = [5000, 10000, 15000];

  @override
  _GymEquipmentViewState createState() => _GymEquipmentViewState();
}

class _GymEquipmentViewState extends State<GymEquipmentView> {
  List<int> quantities = [0, 0, 0];

  void _updateQuantity(int index, int quantity) {
    setState(() {
      quantities[index] = quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: widget.imagePaths.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Gambar alat gym
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    widget.imagePaths[index],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),

                // Detail item
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.equipmentNames[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.equipmentDescriptions[index],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Rp ${widget.equipmentPrices[index]}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                // Quantity buttons
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove, color: Colors.white),
                      onPressed: () {
                        if (quantities[index] > 0) {
                          _updateQuantity(index, quantities[index] - 1);
                        }
                      },
                    ),
                    Text(
                      '${quantities[index]}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        _updateQuantity(index, quantities[index] + 1);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
