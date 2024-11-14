class ClubData {
  final String imagePath;
  final String title;
  final String description;

  const ClubData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

// List of sessions for the Healthy Club
final List<ClubData> clubSessions = [
  ClubData(
    imagePath: "images/home-image/healthy-club/1-sesi.png",
    title: "1 Sesi",
    description: "Durasi kelas selama 1 jam",
  ),
  ClubData(
    imagePath: "images/home-image/healthy-club/4-sesi.png",
    title: "4 Sesi",
    description:
        "Fleksibilitas mengikuti kelas olahraga mana saja dalam waktu 1 bulan",
  ),
  ClubData(
    imagePath: "images/home-image/healthy-club/8-sesi.png",
    title: "8 Sesi",
    description:
        "Fleksibilitas mengikuti kelas olahraga mana saja dalam waktu 2 bulan",
  ),
  ClubData(
    imagePath: "images/home-image/healthy-club/unlimited-1bulan.png",
    title: "Unlimited Sebulan",
    description: "Akses tanpa batas ke semua kelas olahraga selama 1 bulan",
  ),
];
