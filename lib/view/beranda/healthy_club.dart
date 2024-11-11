import 'package:flutter/material.dart';

class HealthyClubView extends StatelessWidget {
  HealthyClubView({super.key});

  // Data for images, titles, and durations
  final List<List<String>> imgDataList = [
    [
      "images/home-image/healthy-club/1-sesi.png",
      "images/home-image/healthy-club/4-sesi.png",
      "images/home-image/healthy-club/8-sesi.png",
    ],
  ];

  final List<List<String>> dataTitlesList = [
    ["Healthy Club 1", "Healthy Club 2", "Healthy Club 3"],
  ];

  final List<List<String>> dataDurationsList = [
    ["Club Membership", "Club Membership", "Club Membership"],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: imgDataList.length, // Use length of imgDataList for iteration
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: imgDataList[index].asMap().entries.map((entry) {
            int i = entry.key;
            String image = entry.value;
            String title = dataTitlesList[index][i];
            String duration = dataDurationsList[index][i];

            return Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              margin: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    child: Image.asset(
                      image,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Details
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
