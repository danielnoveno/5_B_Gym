import 'package:flutter/material.dart';

Widget form_edit(String label, String value, {bool editable = false}) {
  TextEditingController controller = TextEditingController(text: value);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF303030),
            borderRadius: BorderRadius.circular(12),
          ),
          child: editable
              ? TextFormField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    border: InputBorder.none,
                    hintText: 'Enter $label',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                )
              : ListTile(
                  title: Text(
                    value,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
        ),
      ],
    ),
  );
}
