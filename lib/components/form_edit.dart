import 'package:flutter/material.dart';

Widget form_edit(String label, String value, {bool editable = false}) {
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
          child: ListTile(
            title: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            trailing: editable
                ? IconButton(
                    icon: const Icon(Icons.mode_edit_outlined,
                        color: Colors.grey),
                    onPressed: () {
                      // Implement edit action here
                    },
                  )
                : null,
          ),
        ),
      ],
    ),
  );
}
