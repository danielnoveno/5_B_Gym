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
    "title": "Brandom Salim Tangan",
    "duration": "25 Tahun",
    "imagePath": "images/home-image/personal-trainer/Trainer1.png",
    "email": "@brandomsalim",
    "description":
        "Dengan 5 tahun pengalaman di industri kebugaran, saya adalah personal trainer yang berkomitmen untuk membantu klien mencapai tujuan kebugaran mereka. Spesialisasi saya yaitu menurunkan berat badan.",
    "specialization": "Turun berat badan"
  },
  {
    "title": "Rizky Dwi Saputra",
    "duration": "23 Tahun",
    "imagePath": "images/home-image/personal-trainer/Trainer2.png",
    "email": "rizkiyy",
    "description":
        "Memiliki pengalaman selama 2 tahun dibidang industri kebugaran, memiliki semangat yang tinggi untuk membantu klien mencapai badan impiannya. Saya biasanya dipercayai untuk meningkatkan masa otot.",
    "specialization": "Peningaktan masa otot"
  },
  {
    "title": "Bimo Aryo Prakoso ",
    "duration": "24 Tahun",
    "imagePath": "images/home-image/personal-trainer/Trainer3.png",
    "email": "@bimkoso",
    "description":
        "Telah menekuni industri kebugaran selama 4 tahun, memiliki simpati yang tinggi terhadap progress dan semangat klien. Saya biasa dipercayai untuk meningkatkan masa otot.",
    "specialization": "Peningaktan masa otot"
  },
  {
    "title": "Siti Nurjanah",
    "duration": "26 Tahun",
    "imagePath": "images/home-image/personal-trainer/Trainer4.png",
    "email": "@si_janah",
    "description":
        "Saya berpengalaman 4 tahun dibidang industri kebugaran, saya banyal dipercayai untuk menurunkan berat badan dan meningkatkan stamina, terutama untuk kaum wanita.",
    "specialization": "Peningkatan stamina"
  },
  {
    "title": "Happy Yaya",
    "duration": "22 Tahun",
    "imagePath": "images/home-image/personal-trainer/Trainer1.png",
    "email": "@yehappy",
    "description":
        "Telah menekuni industri kebugaran selama 4 tahun, memiliki simpati yang tinggi terhadap progress dan semangat klien. Saya biasa dipercayai untuk meningkatkan masa otot.",
    "specialization": "Flexibility & mobility otot"
  },
  {
    "title": "Dika Smith",
    "duration": "24 Tahun",
    "imagePath": "images/home-image/personal-trainer/Trainer2.png",
    "email": "@dikasmh",
    "description":
        "Specializes in weight loss programs and nutrition coaching.",
    "specialization": "Weight Loss & Nutrition"
  },
  {
    "title": "Samuel Peterson",
    "duration": "23 Tahun",
    "imagePath": "images/home-image/personal-trainer/Trainer3.png",
    "email": "samuel.peterson@fitnessco.com",
    "description": "Focuses on muscle building and hypertrophy training.",
    "specialization": "Muscle Building"
  },
  {
    "title": "Rebecca Chen",
    "duration": "25 years",
    "imagePath": "images/home-image/personal-trainer/Trainer4.png",
    "email": "rebecca.chen@fitpro.com",
    "description": "Specializes in rehabilitation and post-injury recovery.",
    "specialization": "Rehabilitation"
  },
];
