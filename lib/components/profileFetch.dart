import 'package:flutter/material.dart';
// import 'package:tubes_pbp_gym/view/edit_profile.dart';

// Modify your profileButton2 widget to have a style similar to profileButton
Widget profileButton2(BuildContext context, String label, {required VoidCallback onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
    child: Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 54, 54, 54), // Match background color
        borderRadius: BorderRadius.circular(22), // Rounded corners
      ),
      child: ListTile(
        title: Text(
          label,
          style: const TextStyle(color: Colors.white), // Match text style
        ),
        trailing: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        onTap: onPressed, // Use the passed onPressed callback
      ),
    ),
  );
}
