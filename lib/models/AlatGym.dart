class GymEquipment {
  final String image_path;
  final String nama_alat;
  final String deskripsi;
  final int harga;
  int quantity;

  GymEquipment({
    required this.image_path,
    required this.nama_alat,
    required this.deskripsi,
    required this.harga,
    this.quantity = 0,
  });
}
