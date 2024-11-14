import 'package:flutter/material.dart';

Padding inputForm(Function(String?) validasi,
    {required TextEditingController controller,
    required String hintTxt,
    required String helperTxt,
    required IconData iconData,
    bool password = false}) {
  return Padding(
    padding: const EdgeInsets.only(left: 3, top: 10),
    child: SizedBox(
        width: 350,
        child: TextFormField(
          validator: (value) => validasi(value),
          autofocus: true,
          controller: controller,
          obscureText: password,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: hintTxt,
              hintStyle: const TextStyle(color: Colors.white), // Hint text color
              helperStyle: const TextStyle(color: Colors.white), 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: Color(0xFF636363), // Light background color
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(20),
              //   borderSide: BorderSide(color: Colors.grey),
              // ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white),
              ),
              helperText: helperTxt,
              prefixIcon: Icon(iconData, color: Colors.white)),
        )),
  );
}
