import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gd_widget2_b_11663/view/beranda/review_trainer/index_review.dart';

class PersonalTrainerView extends StatelessWidget {
  PersonalTrainerView({super.key});

  // Data for images, titles, durations, emails, and descriptions
  final List<List<String>> imgDataList = [
    [
      "images/home-image/personal-trainer/Trainer1.png",
      "images/home-image/personal-trainer/Trainer2.png",
      "images/home-image/personal-trainer/Trainer3.png",
      "images/home-image/personal-trainer/Trainer4.png",
    ],
  ];

  final List<List<String>> dataTitlesList = [
    [
      "Brandom Salim Tangan",
      "Rizky Dwi Saputra",
      "Bimo Aryo Prakoso",
      "Siti Nurjanah",
    ],
  ];

  final List<List<String>> dataSpesialis = [
    [
      "Berat badan",
      "Masa otot",
      "Masa otot",
      "Stamina badan",
    ],
  ];

  final List<List<String>> dataInstagram = [
    [
      "brandomsalim",
      "rizkiyy",
      "bimkoso",
      "si_janah",
    ],
  ];

  final List<List<String>> dataDescriptionsList = [
    [
      "Dengan 5 tahun pengalaman di industri kebugaran, saya adalah personal trainer yang berkomitmen untuk membantu klien mencapai tujuan kebugaran mereka. Spesialisasi saya yaitu menurunkan berat badan.",
      "Memiliki pengalaman selama 2 tahun dibidang industri kebugaran, memiliki semangat yang tinggi untuk membantu klien mencapai badan impiannya. Saya biasanya dipercayai untuk meningkatkan masa otot.",
      "Telah menekuni industri kebugaran selama 4 tahun, memiliki simpati yang tinggi terhadap progress dan semangat klien. Saya biasa dipercayai untuk meningkatkan masa otot.",
      "Saya berpengalaman 4 tahun dibidang industri kebugaran, saya banyal dipercayai untuk menurunkan berat badan dan meningkatkan stamina.",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      itemCount: imgDataList.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: imgDataList[index].asMap().entries.map((entry) {
            int i = entry.key;
            String image = entry.value;
            String title = dataTitlesList[index][i];
            String duration = dataSpesialis[index][i];
            String email = dataInstagram[index][i];
            String description = dataDescriptionsList[index][i];

            return PersonalTrainerCard(
              title: title,
              duration: duration,
              imagePath: image,
              email: email,
              description: description,
            );
          }).toList(),
        );
      },
    );
  }
}

class PersonalTrainerCard extends StatefulWidget {
  final String title;
  final String duration;
  final String imagePath;
  final String email;
  final String description;

  PersonalTrainerCard({
    required this.title,
    required this.duration,
    required this.imagePath,
    required this.email,
    required this.description,
  });

  @override
  _PersonalTrainerCardState createState() => _PersonalTrainerCardState();
}

class _PersonalTrainerCardState extends State<PersonalTrainerCard> {
  String selectedSession = "4 Sesi";

  @override
  Widget build(BuildContext context) {
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
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      widget.imagePath,
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
                        widget.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "25 Tahun",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.duration,
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
              Text(
                widget.description,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadReview(),
                        ),
                      );
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.chat, color: Colors.white),
                        SizedBox(width: 4),
                        Text("23", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                        size: 22,
                      ),
                      const SizedBox(width: 4),
                      Text(widget.email,
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: selectedSession,
                    items: ["4 Sesi", "8 Sesi", "12 Sesi", "Unlimited Sebulan"]
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(color: Colors.grey)),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSession = value!;
                      });
                    },
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
                    child: const Text(
                      "Pilih",
                      style: TextStyle(color: Colors.white),
                    ),
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
