import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/models/items_cart.dart';
import 'package:intl/intl.dart';

class BottomBar extends StatelessWidget {
  final List<CartItem> cartItems;
  final bool selectAll;
  final ValueChanged<bool?> onSelectAllChanged;
  final VoidCallback onDeleteAll;
  final bool isEditing;

  BottomBar({
    required this.cartItems,
    required this.selectAll,
    required this.onSelectAllChanged,
    required this.onDeleteAll,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    int total = 0;
    for (var item in cartItems) {
      if (item.isSelected && !isEditing) {
        total += (item.price * item.quantity).toInt();
      }
    }

    String totalFormatted = formatRupiah(total);

    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!isEditing)
            Row(
              children: [
                Checkbox(
                  value: selectAll,
                  onChanged: onSelectAllChanged,
                ),
                Text(
                  'Pilih semua',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!isEditing) 
                Text(
                  'Total:',
                  style: TextStyle(color: Colors.white),
                ),
              if (!isEditing) 
                Text(
                  totalFormatted,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isEditing ? Colors.red : Colors.purple,
            ),
            onPressed: isEditing ? onDeleteAll : () {
              // Implementasi untuk tombol bayar
            },
            child: Text(
              isEditing ? 'Hapus' : 'Bayar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  String formatRupiah(int amount) {
    final formatCurrency = NumberFormat('#,##0', 'id_ID');
    return 'Rp ${formatCurrency.format(amount)}';
  }
}
