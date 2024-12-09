import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/edit_profile.dart';
import 'package:tubes_pbp_gym/view/riwayat.dart';

Widget profileButton(BuildContext context, String label, VoidCallback onProfileUpdated) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
    child: Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 54, 54, 54),
        borderRadius: BorderRadius.circular(22),
      ),
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        onTap: () {
          if (label == 'Edit Profile') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfile(
                  onProfileUpdated: onProfileUpdated, // Pass the callback
                ),
              ),
            ).then((_) {
              // Optionally, you can call the callback here if you want to refresh immediately after returning
              onProfileUpdated();
            });
          } else if (label == 'Riwayat') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Riwayat()),
          );
          }
        },
      ),
    ),
  );
}