import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/models/items_cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final ValueChanged<int> onQuantityChanged;
  final ValueChanged<bool?> onCheckboxChanged;
  final VoidCallback onRemoveItem; // Callback untuk menghapus item

  CartItemWidget({
    required this.item,
    required this.onQuantityChanged,
    required this.onCheckboxChanged,
    required this.onRemoveItem, // Mendapatkan callback untuk menghapus item
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 4, spreadRadius: 2)
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: item.isSelected,
            onChanged: onCheckboxChanged,
          ),
          Image.asset(
            item.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 4),
                Text(item.price,
                    style: TextStyle(fontSize: 14, color: Colors.green)),
              ],
            ),
          ),
          Row(
            children: [
              // Tombol pengurangan (minus) hanya aktif jika quantity > 0
              IconButton(
                icon: Icon(Icons.remove,
                    color: item.quantity > 0 ? Colors.black : Colors.grey),
                onPressed: item.quantity > 0
                    ? () {
                        onQuantityChanged(item.quantity - 1);
                      }
                    : null,
              ),
              Text('${item.quantity}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              // Tombol penambahan (plus)
              IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                onPressed: () {
                  onQuantityChanged(item.quantity + 1);
                },
              ),
              // Tombol hapus jika quantity == 0
              if (item.quantity == 0) ...[
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: onRemoveItem, // Hapus item dari keranjang
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
