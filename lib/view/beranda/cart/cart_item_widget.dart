import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/models/items_cart.dart';
import 'package:intl/intl.dart';

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
          if (isEditing)
            Checkbox(
              value: item.isSelected,
              onChanged: onCheckboxChanged,
            ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
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
              if (item.quantity == 0 && isEditing) ...[
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
