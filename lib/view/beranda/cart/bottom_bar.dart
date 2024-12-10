import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/models/items_cart.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tubes_pbp_gym/providers/cart_provider.dart';
import 'package:tubes_pbp_gym/view/Payment/paymentMethod.dart';

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
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isEditing ? Colors.red : Colors.purple,
            ),
            onPressed: isEditing
                ? () {
                    if (selectAll) {
                      _showDeleteAllConfirmationDialog(context);
                    } else {
                      cartItems.forEach((item) {
                        if (item.isSelected) {
                          _showDeleteConfirmationDialog(context, item);
                        }
                      });
                    }
                  }
                : total > 0
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (c) =>
                                PaymentPage(totalFormatted: totalFormatted),
                          ),
                        );
                      }
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Masukkan sesuatu ke dalam keranjang terlebih dahulu!",
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
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

  void _showDeleteAllConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Hapus Semua'),
          content: Text(
              'Apakah Anda yakin ingin menghapus semua item yang dipilih?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                onDeleteAll(); // Menghapus semua item yang dipilih
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, CartItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Hapus'),
          content: Text(
              'Apakah Anda yakin ingin menghapus item "${item.membershipTitle}"?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                _removeItemFromCart(context, item);
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  void _removeItemFromCart(BuildContext context, CartItem item) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    int index = cartProvider.cartItems.indexOf(item); // Menemukan indeks item
    if (index != -1) {
      cartProvider.removeItem(index); // Hapus item menggunakan indeks
    }
  }
}
