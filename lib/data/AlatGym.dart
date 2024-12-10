class GymEquipment {
  final String image_path;
  final String nama_alat;
  final String deskripsi;
  final int harga;
  int quantity; // Tambahkan properti quantity

  GymEquipment({
    required this.image_path,
    required this.nama_alat,
    required this.deskripsi,
    required this.harga,
    this.quantity = 0, // Inisialisasi nilai default
  });
}

// List of gym equipment data
final List<GymEquipment> gymEquipments = [
  GymEquipment(
    image_path: "images/home-image/alat-gym/exercise-mat.png",
    nama_alat: "Exercise Mat",
    deskripsi: "Comfortable mat for your workout sessions.",
    harga: 5000,
  ),
  GymEquipment(
    image_path: "images/home-image/alat-gym/foam-roller.png",
    nama_alat: "Foam Roller",
    deskripsi: "Perfect for muscle relaxation and recovery.",
    harga: 10000,
  ),
  GymEquipment(
    image_path: "images/home-image/alat-gym/weight-vest.png",
    nama_alat: "Weight Vest",
    deskripsi: "Increase intensity with this weight vest.",
    harga: 15000,
  ),
  GymEquipment(
    image_path: "images/home-image/alat-gym/adjustable-dumbbells.png",
    nama_alat: "Adjustable Dumbbells",
    deskripsi: "Adjustable dumbbells for various exercises.",
    harga: 20000,
  ),
  GymEquipment(
    image_path: "images/home-image/alat-gym/kettlebells-8kg.png",
    nama_alat: "Kettlebells 8kg",
    deskripsi: "8kg kettlebell for strength training.",
    harga: 20000,
  ),
  GymEquipment(
    image_path: "images/home-image/alat-gym/resistance-band.png",
    nama_alat: "Resistance Band",
    deskripsi: "Resistance band for mobility and strength.",
    harga: 10000,
  ),
];
