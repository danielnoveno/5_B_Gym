import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/entitiy/Cart.dart';
import 'package:intl/intl.dart';
import 'package:tubes_pbp_gym/client/CartClient.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final ValueChanged<int> onQuantityChanged;
  final ValueChanged<bool?> onCheckboxChanged;
  final VoidCallback onRemoveItem;
  final bool isEditing;

  CartItemWidget({
    required this.item,
    required this.onQuantityChanged,
    required this.onCheckboxChanged,
    required this.onRemoveItem,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Checkbox(
            value: item.isSelected,
            onChanged: (bool? value) {
              onCheckboxChanged(value);
              _updateCartItemSelection(value);
            },
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              item.getImageUrl(),
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.membershipTitle,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 4),
                if (!isEditing)
                  Text(
                    formatCurrency.format(item.price),
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove,
                          color:
                              item.quantity > 0 ? Colors.black : Colors.grey),
                      onPressed: item.quantity > 0
                          ? () {
                              onQuantityChanged(item.quantity - 1);
                              _updateCartItemQuantity(item.quantity - 1);
                            }
                          : null,
                    ),
                    Text('${item.quantity}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.black),
                      onPressed: () {
                        onQuantityChanged(item.quantity + 1);
                        _updateCartItemQuantity(item.quantity + 1);
                      },
                    ),
                  ],
                ),
              ),
              if (item.quantity == 0 && isEditing) ...[
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _showDeleteConfirmationDialog(context, item);
                  },
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  // Konfirmasi untuk menghapus item individu
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
                onRemoveItem(); // Menghapus item tersebut
                _deleteCartItem(item.id); // Delete item from server
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  // Update Cart Item quantity and selection
  void _updateCartItemQuantity(int newQuantity) async {
    item.quantity = newQuantity;
    await CartItemClient.update(item); // Update item in server
  }

  // Update Cart Item selection status
  void _updateCartItemSelection(bool? value) async {
    item.isSelected = value ?? false;
    await CartItemClient.update(item); // Update item selection status in server
  }

  // Delete the item from the cart
  void _deleteCartItem(int id) async {
    await CartItemClient.destroy(id);
  }
}
