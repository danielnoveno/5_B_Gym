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
          // Membungkus gambar dengan ClipRRect untuk memberikan sudut rounded
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // Menentukan radius sudut
            child: Image.asset(
              item.image,
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
                // Menambahkan maxLines dan overflow untuk menghindari pemotongan
                Text(
                  item.membershipTitle,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.visible, // Menyembunyikan ellipsis
                  maxLines: 2, // Menambahkan 2 baris untuk judul panjang
                ),
                SizedBox(height: 4),
                Text(item.price,
                    style: TextStyle(fontSize: 14, color: Colors.green)),
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
                      },
                    ),
                  ],
                ),
              ),
              if (item.quantity == 0) ...[
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: onRemoveItem,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
