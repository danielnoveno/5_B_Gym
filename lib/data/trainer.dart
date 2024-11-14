class Trainer {
  final String title;
  final String duration;
  final String imagePath;
  final String email;
  final String description;
  final String specialization;

  const Trainer(this.title, this.duration, this.imagePath, this.email,
      this.description, this.specialization);
}

final List<Trainer> trainer = _trainer
    .map((e) => Trainer(
        e['title'] as String,
        e['duration'] as String,
        e['imagePath'] as String,
        e['email'] as String,
        e['description'] as String,
        e['specialization'] as String))
    .toList(growable: false);

final List<Map<String, String>> _trainer = [
  {
    "title": "Angelina Derrel",
    "duration": "2 years",
    "imagePath": "images/home-image/personal-trainer/Trainer1.png",
    "email": "angelina@kengen.com",
    "description": "Expert in functional training and bodyweight exercises.",
    "specialization": "Functional Training"
  },
  {
    "title": "Stewart",
    "duration": "1.5 years",
    "imagePath": "images/home-image/personal-trainer/Trainer2.png",
    "email": "stewart@ontality.com",
    "description":
        "Focuses on strength training and high-intensity interval training.",
    "specialization": "Strength Training"
  },
  {
    "title": "Noveno",
    "duration": "3 years",
    "imagePath": "images/home-image/personal-trainer/Trainer3.png",
    "email": "novenoo@splinx.com",
    "description":
        "Specializes in cardiovascular health and endurance training.",
    "specialization": "Cardiovascular Health"
  },
  {
    "title": "Mario",
    "duration": "5 years",
    "imagePath": "images/home-image/personal-trainer/Trainer4.png",
    "email": "mariomario@buzzworks.com",
    "description": "Experienced in holistic fitness and lifestyle coaching.",
    "specialization": "Holistic Fitness"
  },
  {
    "title": "Russel",
    "duration": "2.5 years",
    "imagePath": "images/home-image/personal-trainer/Trainer1.png",
    "email": "russelll@temorak.com",
    "description": "Expert in flexibility and mobility improvement programs.",
    "specialization": "Flexibility & Mobility"
  },
  {
    "title": "Lara Smith",
    "duration": "4 years",
    "imagePath": "images/home-image/personal-trainer/Trainer2.png",
    "email": "lara.smith@fitnesspro.com",
    "description":
        "Specializes in weight loss programs and nutrition coaching.",
    "specialization": "Weight Loss & Nutrition"
  },
  {
    "title": "Samuel Peterson",
    "duration": "3 years",
    "imagePath": "images/home-image/personal-trainer/Trainer3.png",
    "email": "samuel.peterson@fitnessco.com",
    "description": "Focuses on muscle building and hypertrophy training.",
    "specialization": "Muscle Building"
  },
  {
    "title": "Rebecca Chen",
    "duration": "5 years",
    "imagePath": "images/home-image/personal-trainer/Trainer4.png",
    "email": "rebecca.chen@fitpro.com",
    "description": "Specializes in rehabilitation and post-injury recovery.",
    "specialization": "Rehabilitation"
  },
];
