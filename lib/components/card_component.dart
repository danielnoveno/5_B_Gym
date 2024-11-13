import 'package:flutter/material.dart';

Widget infoCard1(String value, String label) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 35),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 30, 30, 30),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        bottomLeft: Radius.circular(16),
      ),
    ),
    child: Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

Widget infoCard2(String value, String label) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 35),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 30, 30, 30),
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
    ),
    child: Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

Widget infoCard3(String value, String label) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 25),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 30, 30, 30),
    ),
    child: Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
