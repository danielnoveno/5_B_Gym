import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/beranda/cart/cart_item_widget.dart';
import 'package:tubes_pbp_gym/view/beranda/cart/bottom_bar.dart';
import 'package:tubes_pbp_gym/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Keranjang', style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                isEditing = !isEditing; // Toggle edit mode
              });
            },
            child: Text(
              isEditing ? 'Done' : 'Edit', // Toggle button text
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartItemWidget(
                      item: cartProvider.cartItems[index],
                      onQuantityChanged: (newQuantity) {
                        cartProvider.updateQuantity(index, newQuantity);
                      },
                      onCheckboxChanged: (value) {
                        cartProvider.updateSelection(index, value ?? false);
                      },
                      onRemoveItem: () {
                        cartProvider.removeItem(index);
                      },
                      isEditing: isEditing, // Pass the edit mode to each item
                    );
                  },
                ),
              ),
              BottomBar(
                cartItems: cartProvider.cartItems,
                selectAll:
                    cartProvider.cartItems.every((item) => item.isSelected),
                onSelectAllChanged: (bool? value) {
                  cartProvider.selectAllItems(value ?? false);
                },
                onDeleteAll: () {
                  cartProvider.clearSelectedItems();
                },
                isEditing: isEditing, // Pass the edit mode to the BottomBar
              ),
            ],
          );
        },
      ),
    );
  }
}
