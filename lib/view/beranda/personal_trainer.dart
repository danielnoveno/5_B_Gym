import 'package:flutter/material.dart';

class PersonalTrainerView extends StatelessWidget {
  PersonalTrainerView({super.key});

  // Data for images, titles, and durations
  final List<List<String>> imgDataList = [
    [
      "images/home-image/personal-trainer/Trainer1.png",
      "images/home-image/personal-trainer/Trainer2.png",
      "images/home-image/personal-trainer/Trainer3.png",
    ],
  ];

  final List<List<String>> dataTitlesList = [
    ["Trainer 1", "Trainer 2", "Trainer 3"],
  ];

  final List<List<String>> dataDurationsList = [
    ["Personal Training", "Personal Training", "Personal Training"],
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

            return _buildCard(
              title: title,
              duration: duration,
              imagePath: image,
            );
          }).toList(),
        );
      },
    );
  }

  // Reusable card-building widget function
  Widget _buildCard({
    required String title,
    required String duration,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section for profile photo
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      imagePath,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
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
                        "25 Tahun", // Example age (you can replace this with actual data)
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
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
                ],
              ),
              const SizedBox(height: 16),

              // Description and specialization
              const Text(
                "Dengan 5 tahun pengalaman di industri kebugaran...",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),

              // Icons for social media and experience
              Row(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.calendar_today, color: Colors.white),
                      SizedBox(width: 4),
                      Text("23", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: const [
                      Icon(Icons.alternate_email, color: Colors.white),
                      SizedBox(width: 4),
                      Text("@brandonsalim",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Dropdown and "Pilih" button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: "4 Sesi",
                    items: ["4 Sesi", "8 Sesi", "12 Sesi"]
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(color: Colors.grey)),
                            ))
                        .toList(),
                    onChanged: (value) {},
                    dropdownColor: Colors.grey[800],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF673296),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Pilih"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
