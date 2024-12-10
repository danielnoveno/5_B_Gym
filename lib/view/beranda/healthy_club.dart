import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/beranda/card_healthy_club/1_sesi.dart';
import 'package:tubes_pbp_gym/view/beranda/card_healthy_club/4_sesi.dart';
import 'package:tubes_pbp_gym/view/beranda/card_healthy_club/8_sesi.dart';
import 'package:tubes_pbp_gym/view/beranda/card_healthy_club/unlimited.dart';
import 'package:tubes_pbp_gym/client/Healthy_clubClient.dart';
import 'package:tubes_pbp_gym/entitiy/HealthyClub.dart';

class HealthyClubView extends StatefulWidget {
  const HealthyClubView({super.key});

  @override
  _HealthyClubViewState createState() => _HealthyClubViewState();
}

class _HealthyClubViewState extends State<HealthyClubView> {
  late Future<List<KelasOlahragas>> kelasOlahragasList;

  @override
  void initState() {
    super.initState();
    kelasOlahragasList = KelasOlahragaClient.fetchAll(); // Fetch data
  }

  // Function to navigate to the appropriate page based on the title
  void _navigateToPage(
      BuildContext context, String title, KelasOlahragas kelasOlahraga) {
    switch (title) {
      case "1 Sesi":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HealthyClub1Sesi(kelasOlahragaId: kelasOlahraga.idKelas),
          ),
        );
        break;
      case "4 Sesi":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HealthyClub4Sesi(kelasOlahragaId: kelasOlahraga.idKelas),
          ),
        );
        break;
      case "8 Sesi":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HealthyClub8Sesi(kelasOlahragaId: kelasOlahraga.idKelas),
          ),
        );
        break;
      case "Unlimited Sebulan":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HealthyClubUnlimited(kelasOlahragaId: kelasOlahraga.idKelas),
          ),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<KelasOlahragas>>(
      future: kelasOlahragasList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No classes available.'));
        }

        final kelasOlahragasList = snapshot.data!;

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: kelasOlahragasList.length,
          itemBuilder: (context, index) {
            final kelas = kelasOlahragasList[index];

            return GestureDetector(
              onTap: () {
                _navigateToPage(
                    context, kelas.judul, kelas); // Pass the selected kelas
              },
              child: Card(
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                margin: const EdgeInsets.only(bottom: 16),
                child: Stack(
                  children: [
                    // Image with error handling
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      child: Image.asset(
                        kelas.imagePath,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        // Error handling
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Center(
                            child: Text(
                              'Failed to load image',
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        },
                      ),
                    ),
                    // Transparent Gradient
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.9),
                                Colors.black.withOpacity(0.1),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Text and Direct Icon
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    kelas.judul,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    kelas.deskripsi.join(
                                        ', '), // Display deskripsi as a string
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Direct Icon for Navigation
                            GestureDetector(
                              onTap: () {
                                _navigateToPage(context, kelas.judul,
                                    kelas); // Pass the selected kelas
                              },
                              child: Container(
                                width: 42,
                                height: 42,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFF673296),
                                  shape: OvalBorder(),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'icons/icons-home/direct-intocard.png',
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
