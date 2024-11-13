import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/components/card_component.dart';
import 'package:tubes_pbp_gym/components/button_component.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
              const SizedBox(height: 10),
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("images/FotoProfil.png"),
              ),
              const SizedBox(height: 10),
              const Text(
                'Mariwow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'marimar@gmail.com',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                '08123123123',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  infoCard1('75 Kg', 'Weight'),
                  const SizedBox(width: 1),
                  infoCard3('180 Cm', 'Height'),
                  const SizedBox(width: 1),
                  infoCard2('24 Yr', 'Age'),
                ],
              ),
              const SizedBox(height: 10),
              profileButton(context, 'Edit Profile'),
              profileButton(context, 'Riwayat'),
              profileButton(context, 'Penilaian'),
              const SizedBox(height: 20),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
