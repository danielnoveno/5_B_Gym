import '../models/healthy_club.dart';

final List<KelasOlahraga> kelasOlahragaList = [
  KelasOlahraga(
    id: '1',
    title: '1 Sesi',
    price: 'Rp 75.000',
    imagePath: 'images/home-image/healthy-club/1-sesi.png',
    features: [
      'Durasi kelas selama 1 jam',
      'Akses ke satu kelas olahraga pilihan',
    ],
    availableClasses: ['Zumba', 'Yoga', 'HIIT', 'Spinning', 'Pilates'],
  ),
  KelasOlahraga(
    id: '2',
    title: '4 Sesi',
    price: 'Rp 280.000',
    imagePath: 'images/home-image/healthy-club/4-sesi.png',
    features: [
      'Diskon 20.000 dari harga normal per-sesi',
      'Fleksibilitas mengikuti kelas olahraga mana saja dalam waktu 1 bulan',
    ],
    availableClasses: ['Zumba', 'Yoga', 'HIIT', 'Spinning', 'Pilates'],
  ),
  KelasOlahraga(
    id: '3',
    title: '8 Sesi',
    price: 'Rp 520.000',
    imagePath: 'images/home-image/healthy-club/8-sesi.png',
    features: [
      'Diskon 80.000 dari harga normal per-sesi',
      'Fleksibilitas mengikuti kelas olahraga mana saja dalam waktu 2 bulan',
    ],
    availableClasses: ['Zumba', 'Yoga', 'HIIT', 'Spinning', 'Pilates'],
  ),
  KelasOlahraga(
    id: '4',
    title: 'Unlimited Sebulan',
    price: 'Rp 600.000',
    imagePath: 'images/home-image/healthy-club/unlimited-1bulan.png',
    features: [
      'Akses tanpa batas ke semua kelas olahraga selama 1 bulan.',
      'Pilihan terbaik bagi pengguna yang ingin mencoba berbagai jenis kelas dan berlatih secara intensif.',
    ],
    availableClasses: ['Zumba', 'Yoga', 'HIIT', 'Spinning', 'Pilates'],
  ),
];
