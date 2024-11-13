import 'package:flutter/material.dart';
import 'package:gd_widget2_b_11663/view/edit_profile.dart';

Widget profileButton(BuildContext context, String label) {
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
              MaterialPageRoute(builder: (context) => const EditProfile()),
            );
          }
        },
      ),
    ),
  );
}
