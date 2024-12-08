import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/beranda/card_healthy_club/1_sesi.dart';
import 'package:tubes_pbp_gym/view/beranda/card_healthy_club/4_sesi.dart';
import 'package:tubes_pbp_gym/view/beranda/card_healthy_club/8_sesi.dart';
import 'package:tubes_pbp_gym/view/beranda/card_healthy_club/unlimited.dart';
import 'package:tubes_pbp_gym/client/Healthy_clubClient.dart';
import 'package:tubes_pbp_gym/entitiy/HealthyClub.dart';

class HealthyClubView extends StatelessWidget {
  HealthyClubView({super.key});

  get kelasOlahraga => null;

  // Function to navigate to the appropriate page based on the title
  void _navigateToPage(
      BuildContext context, String title, KelasOlahragas kelasOlahragas) {
    switch (title) {
      case "1 Sesi":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HealthyClub1Sesi(kelasOlahraga: kelasOlahraga),
          ),
        );
        break;
      case "4 Sesi":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HealthyClub4Sesi(kelasOlahraga: kelasOlahraga),
          ),
        );
        break;
      case "8 Sesi":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HealthyClub8Sesi(kelasOlahraga: kelasOlahraga),
          ),
        );
        break;
      case "Unlimited Sebulan":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HealthyClubUnlimited(kelasOlahraga: kelasOlahraga),
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
      future: KelasOlahragaClient.fetchAll(), // Fetch data from the API
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator()); // Show loading spinner
        }

        if (snapshot.hasError) {
          return Center(
              child: Text('Error: ${snapshot.error}')); // Show error message
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available')); // Show if no data
        }

        final List<KelasOlahragas> kelasOlahragasList = snapshot.data!;

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: kelasOlahragasList.length,
          itemBuilder: (context, index) {
            final kelasOlahraga = kelasOlahragasList[index];

            return GestureDetector(
              onTap: () {
                _navigateToPage(context, kelasOlahraga.judul, kelasOlahraga);
              },
              child: Card(
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                margin: const EdgeInsets.only(bottom: 16),
                child: Stack(
                  children: [
                    // Image
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      child: Image.network(
                        kelasOlahraga.imagePath, // Use network image here
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
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
                                    kelasOlahraga.judul,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    kelasOlahraga.deskripsi.join(", "),
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
                                _navigateToPage(context, kelasOlahraga.judul,
                                    kelasOlahraga);
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
