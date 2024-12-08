import '../models/membership_package.dart';

// Data Solo Packages
final List<MembershipPackage> soloPackages = [
  MembershipPackage(
    title: '30 Hari',
    description: [
      "Akses penuh ke gym dan fasilitas",
      "Tidak ada sesi personal trainer",
    ],
    price: 'Rp 300.000',
    total: 'Rp 300.000',
  ),
  MembershipPackage(
    title: '12 Bulan',
    description: [
      "Akses penuh ke gym dan fasilitas",
      "Dua sesi personal trainer",
      "Potongan harga satu bulan",
    ],
    price: "Rp 275.000/bulan",
    total: "Rp 3.300.000",
  ),
  MembershipPackage(
    title: '24 Bulan',
    description: [
      "Akses penuh ke gym dan fasilitas",
      "Dua sesi personal trainer",
      "Potongan harga 10%",
      "Akses gratis ke semua kelas selama 1 minggu setiap 6 bulan",
      "Free gym merchandise (towel, bottle, t-shirt)",
    ],
    price: "Rp 270.000/bulan",
    total: "Rp 6.480.000",
  ),
];

// Data Couple Packages
final List<MembershipPackage> couplePackages = [
  MembershipPackage(
    title: '30 Hari',
    description: [
      "Akses penuh untuk 2 orang ke gym dan fasilitas",
      "Tidak ada sesi personal trainer",
    ],
    price: "Rp 550.000/bulan",
    total: "Rp 550.000",
  ),
  MembershipPackage(
    title: '12 Bulan',
    description: [
      "Akses penuh untuk 2 orang ke gym dan fasilitas",
      "Dua sesi personal trainer per-orang",
      "Potongan harga satu bulan",
    ],
    price: "Rp 6.000.000/bulan",
    total: "Rp 6.000.000",
  ),
  MembershipPackage(
    title: '24 Bulan',
    description: [
      "Akses penuh untuk 2 orang ke gym dan fasilitas",
      "Dua sesi personal trainer",
      "Potongan harga 15%",
      "Akses gratis ke semua kelas selama 1 minggu setiap 6 bulan",
      "Free gym merchandise (towel, bottle, t-shirt)",
    ],
    price: "Rp 11.220.000/bulan",
    total: "Rp 11.220.000",
  ),
];

// Data Group Packages
final List<MembershipPackage> groupPackages = [
  MembershipPackage(
    title: '30 Hari',
    description: [
      "Akses penuh untuk 4 orang ke gym dan fasilitas",
      "Tidak ada sesi personal trainer",
    ],
    price: "Rp 1.000.000/bulan",
    total: "Rp 1.000.000",
  ),
  MembershipPackage(
    title: '12 Bulan',
    description: [
      "Akses penuh untuk 4 orang ke gym dan fasilitas",
      "Dua sesi personal trainer per-orang",
      "Potongan harga satu bulan",
    ],
    price: "Rp 10.800.000/bulan",
    total: "Rp 10.800.000",
  ),
  MembershipPackage(
    title: '24 Bulan',
    description: [
      "Akses penuh untuk 4 orang ke gym dan fasilitas",
      "Dua sesi personal trainer per-orang",
      "Potongan harga 20%",
      "Akses gratis ke semua kelas selama 1 minggu setiap 6 bulan",
      "Free gym merchandise (towel, bottle, t-shirt)",
      "Free access fasilitas spa/sauna 1x/bulan per-orang",
      "Sesi konsultasi nutrisi gratis per orang",
    ],
    price: "Rp 19.200.000/bulan",
    total: "Rp 19.200.000",
  ),
];
