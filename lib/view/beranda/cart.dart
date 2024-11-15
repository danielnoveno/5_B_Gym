import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem('Kelas Olahraga - 4 Sesi', 'Rp 280.000', 'images/health-club.jpg'),
    CartItem('Membership - Solo 12 Bulan', 'Rp 280.000',
        'images/home-image/membership/solo.png'),
    CartItem('Kelas Olahraga - 8 Sesi', 'Rp 520.000',
        'images/home-image/membership/yoga.png'),
    CartItem('Trainer - Brandon 24 Sesi', 'Rp 520.000',
        'images/home-image/personal-trainer/Trainer3.png'),
    CartItem('Kelas Olahraga - 8 Sesi', 'Rp 520.000',
        'images/home-image/membership/yoga.png'),
    CartItem('Alat Gym - Kettlebells 8kg', 'Rp 20.000',
        'images/home-image/alat-gym/kettlebells-8kg.png'),
  ];

  bool? selectAll = false;

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
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  item: cartItems[index],
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      cartItems[index].quantity = newQuantity;
                    });
                  },
                  onCheckboxChanged: (value) {
                    setState(() {
                      cartItems[index].isSelected = value ?? false;
                    });
                  },
                );
              },
            ),
          ),
          BottomBar(
            cartItems: cartItems,
            selectAll: selectAll,
            onSelectAllChanged: (bool? value) {
              setState(() {
                selectAll = value;
                for (var item in cartItems) {
                  item.isSelected = value ?? false;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String title;
  final String price;
  final String image;
  bool isSelected;
  int quantity;

  CartItem(this.title, this.price, this.image,
      {this.isSelected = false, this.quantity = 1});
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final ValueChanged<int> onQuantityChanged;
  final ValueChanged<bool?> onCheckboxChanged;

  CartItemWidget({
    required this.item,
    required this.onQuantityChanged,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
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
                ),
                SizedBox(height: 4),
                Text(item.price, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove, color: Colors.black),
                onPressed: item.quantity > 1
                    ? () {
                        onQuantityChanged(item.quantity - 1);
                      }
                    : null,
              ),
              Text('${item.quantity}', style: TextStyle(fontSize: 16)),
              IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                onPressed: () {
                  onQuantityChanged(item.quantity + 1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final List<CartItem> cartItems;
  final bool? selectAll;
  final ValueChanged<bool?> onSelectAllChanged;

  BottomBar({
    required this.cartItems,
    required this.selectAll,
    required this.onSelectAllChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Menghitung total harga
    int total = 0;
    for (var item in cartItems) {
      if (item.isSelected) {
        // Mengambil hanya angka dari harga dan mengonversinya menjadi integer
        int price = int.tryParse(item.price.replaceAll(RegExp(r'\D'), '')) ?? 0;
        total += price * item.quantity;
      }
    }

    // Memformat total harga dalam format Rupiah
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

  // Fungsi untuk memformat angka menjadi format Rupiah
  String formatRupiah(int amount) {
    final formatCurrency = NumberFormat('#,##0', 'id_ID');
    return 'Rp ${formatCurrency.format(amount)}';
  }
}
