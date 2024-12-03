import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/entitiy/Membership.dart';
import 'package:tubes_pbp_gym/client/MembershipClient.dart';
import 'package:tubes_pbp_gym/view/beranda/card_membership/solo.dart';
import 'package:tubes_pbp_gym/view/beranda/card_membership/couple.dart';
import 'package:tubes_pbp_gym/view/beranda/card_membership/group.dart';

class MembershipView extends StatelessWidget {
  MembershipView({super.key});

  // Fungsi untuk menavigasi ke halaman yang sesuai
  void _navigateToPage(BuildContext context, String title) {
    switch (title) {
      case "SOLO":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SoloPage()),
        );
        break;
      case "COUPLE":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CouplePage()),
        );
        break;
      case "GROUP":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GroupPage()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Membership>>(
      future: MembershipClient
          .fetchAll(), // Memanggil API untuk mendapatkan semua Membership
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child:
                  CircularProgressIndicator()); // Menampilkan loading indicator saat menunggu data
        }

        if (snapshot.hasError) {
          return Center(
              child: Text(
                  'Error: ${snapshot.error}')); // Menampilkan error jika terjadi kesalahan
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
              child: Text(
                  'No memberships available')); // Menampilkan pesan jika tidak ada data
        }

        List<Membership> memberships = snapshot.data!;

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          itemCount: memberships.length,
          itemBuilder: (context, index) {
            Membership membership = memberships[index];

            return GestureDetector(
              onTap: () {
                // Navigasi ke halaman yang sesuai berdasarkan title
                _navigateToPage(context, membership.title);
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
                      child: membership.image != null
                          ? Image.network(
                              'http://127.0.0.1:8000//storage/app/public/images/${membership.image}',
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
                                                1)
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/placeholder.png',
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                );
                              },
                            )
                          : Image.asset(
                              'assets/images/placeholder.png', // Placeholder image
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                    ),
                    // Gradient overlay
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
                    // Text Content
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
                                    membership.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    membership.duration,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Purple Icon with GestureDetector
                            GestureDetector(
                              onTap: () {
                                // Navigasi ke halaman yang sesuai saat icon di-tap
                                _navigateToPage(context, membership.title);
                              },
                              child: Container(
                                width: 42,
                                height: 42,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 42,
                                        height: 42,
                                        decoration: const ShapeDecoration(
                                          color: Color(0xFF673296),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 9,
                                      top: 9,
                                      child: Image.asset(
                                        'icons/icons-home/direct-intocard.png',
                                        width: 24,
                                        height: 24,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
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
