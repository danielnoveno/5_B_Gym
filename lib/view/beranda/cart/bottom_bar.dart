import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tubes_pbp_gym/models/items_cart.dart';

class BottomBar extends StatelessWidget {
  final List<CartItem> cartItems;
  final bool selectAll;
  final ValueChanged<bool?> onSelectAllChanged;

  BottomBar({
    required this.cartItems,
    required this.selectAll,
    required this.onSelectAllChanged,
  });

  @override
  Widget build(BuildContext context) {
    int total = 0;
    for (var item in cartItems) {
      if (item.isSelected) {
        int price =
            (double.tryParse(item.price.replaceAll(RegExp(r'\D'), '')) ?? 0)
                .toInt();
        total += price * item.quantity;
      }
    }

    String totalFormatted = formatRupiah(total);

    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
              Text(
                'Total:',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                totalFormatted,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            ),
            onPressed: () {},
            child: Text(
              'Bayar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // Format total amount as Rupiah
  String formatRupiah(int amount) {
    final formatCurrency = NumberFormat('#,##0', 'id_ID');
    return 'Rp ${formatCurrency.format(amount)}';
  }
}
