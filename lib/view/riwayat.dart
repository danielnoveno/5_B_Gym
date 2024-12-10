import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/addreview.dart';
import 'package:tubes_pbp_gym/entitiy/Riwayat.dart';
import 'package:tubes_pbp_gym/client/RiwayatClient.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _formatDate(DateTime date) {
  final months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Agu",
    "Sep",
    "Okt",
    "Nov",
    "Des"
  ];

  String day = date.day.toString().padLeft(2, '0');
  String month = months[date.month - 1];
  String year = date.year.toString();

  return '$day $month $year';
}

String _formatTime(DateTime date) {
  // Format time in 24-hour format with leading zeroes
  String hour = date.hour.toString().padLeft(2, '0');
  String minute = date.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

class RiwayatPage extends StatefulWidget {
  @override
  _RiwayatPageState createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  late Future<List<Riwayat>> futureRiwayat;

   @override
  void initState() {
    super.initState();
    futureRiwayat = _fetchRiwayat(); // Fetch data when the widget is initialized
  }

  Future<List<Riwayat>> _fetchRiwayat() async {
    final prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');

    if (userId == null) {
      throw Exception('User  not logged in');
    }

    return await RiwayatClient.fetchByPelanggan(userId); // Pass userId to fetchByPelanggan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Riwayat',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder<List<Riwayat>>(
        future: futureRiwayat,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Belum ada riwayat pembelian', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),));
          }

          // If data is available, display it
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final riwayat = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  width: 42.0,
                  height: 290.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(174, 194, 73, 255),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Stack(
                      children: [
                        // First inner box
                        Positioned(
                          top: 20,
                          left: 15,
                          child: SizedBox(
                            width: 330,
                            height: 80,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(150, 200, 200, 200),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Stack(children: [
                                // Image inside the box
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    riwayat.imagePath, // Using the imagePath from Riwayat
                                    fit: BoxFit.cover,
                                    width: 180,
                                    height: 110,
                                    errorBuilder: (context, error, stackTrace) {
                                      // Fallback if the image fails to load
                                      return Image.asset(
                                        riwayat.imagePath, // Default local image
                                        fit: BoxFit.cover,
                                        width: 180,
                                        height: 110,
                                      );
                                    },
                                  ),
                                ),
                                // Text overlay
                                Positioned(
                                  top: 10,
                                  left: 220,
                                  child: Text(
                                    'Pesanan',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                // Date
                                Positioned(
                                  top: 30,
                                  left: 220,
                                  child: Text(
                                    _formatDate(riwayat.tanggalRiwayat),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                // Time
                                Positioned(
                                  top: 50,
                                  left: 220,
                                  child: Text(
                                    _formatTime(riwayat.tanggalRiwayat) +
                                        ' WIB',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                        // Second inner box
                        Positioned(
                          top: 125,
                          left: 15,
                          child: SizedBox(
                            width: 330,
                            height: 150,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(162, 79, 79, 79),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Stack(children: [
                                Positioned(
                                  top: 20,
                                  left: 15,
                                  child: Text(
                                    '${riwayat.jenisLayanan}', // Displaying the service type
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                  top: 50,
                                  left: 15,
                                  child: Text(
                                    'Total Pembelian',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 80,
                                  left: 15,
                                  child: Text(
                                    'Rp. ${riwayat.totalHarga.toStringAsFixed(0)}', // Displaying the total price
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                  top: 90,
                                  right: 15,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (riwayat.jenisLayanan.contains("Trainer")) // Check if jenisLayanan contains "Trainer"
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (c) => const Addreview(),
                                              ),
                                            );
                                          },
                                          child: Text('Review'),
                                        ),
                                      SizedBox(width: 5),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Berhasil'),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
