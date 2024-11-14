import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubes_pbp_gym/view/beranda/review_trainer/index_review.dart';
import 'package:tubes_pbp_gym/data/trainer.dart';

class PersonalTrainerView extends StatelessWidget {
  final List<Trainer> trainers = trainer;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      itemCount: trainers.length,
      itemBuilder: (context, index) {
        final Trainer trainer = trainers[index];

        return PersonalTrainerCard(
          title: trainer.title,
          duration: trainer.duration,
          imagePath: trainer.imagePath,
          email: trainer.email,
          description: trainer.description,
          specialization: trainer.specialization, // Add specialization
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
  final String specialization; // Add specialization

  PersonalTrainerCard({
    required this.title,
    required this.duration,
    required this.imagePath,
    required this.email,
    required this.description,
    required this.specialization, // Add specialization
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
                        widget.specialization, // Display specialization
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
