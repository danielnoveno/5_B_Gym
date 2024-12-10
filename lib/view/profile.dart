import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/components/card_component.dart';
import 'package:tubes_pbp_gym/components/button_component.dart';
// import 'package:tubes_pbp_gym/view/login.dart';
import 'package:tubes_pbp_gym/entitiy/Pelanggan.dart';
import 'package:tubes_pbp_gym/client/PelangganClient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Future<Pelanggan> _profileFuture;

  @override
  void initState() {
    super.initState();
    _profileFuture = _fetchProfile(); // Load the profile when the widget is initialized
  }

  Future<Pelanggan> _fetchProfile() async {
    final prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');

    if (userId == null) {
      throw Exception('User not logged in');
    }

    return await PelangganClient.find(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<Pelanggan>(
            future: _profileFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return Center(child: Text('No data available'));
              }

              Pelanggan pelanggan = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      'My Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("images/FotoProfil.png"),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    pelanggan.nama, // Display dynamic username
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    pelanggan.email, // Display dynamic email
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    pelanggan.noTelepon, // Display dynamic phone number
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  // const SizedBox(height: 20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     infoCard1('75 Kg', 'Weight'),
                  //     const SizedBox(width: 1),
                  //     infoCard3('180 Cm', 'Height'),
                  //     const SizedBox(width: 1),
                  //     infoCard2('${pelanggan.umur} Yr', 'Age'), // Display dynamic age
                  //   ],
                  // ),
                  const SizedBox(height: 10),
                  profileButton(context, 'Edit Profile', () {
                  setState(() {
                    _profileFuture = _fetchProfile(); // Refresh the profile
                    });
                  }),
                  profileButton(context, 'Riwayat', () {}),
                  // profileButton(context, ' Penilaian', () {}),
                  const SizedBox(height: 20),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    icon: const Icon(Icons.logout, color: Colors.red),
                    label: const Text(
                      'Log Out',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
