import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<CartItem> cartItems = [
    CartItem('Kelas Olahraga - 4 Sesi', 'Rp 280.000', 'images/health-club.jpg'),
    CartItem('Membership - Solo 12 Bulan', 'Rp 280.000', 'images/home-image/membership/solo.png'),
    CartItem('Kelas Olahraga - 8 Sesi', 'Rp 520.000', 'images/home-image/membership/yoga.png'),
    CartItem('Trainer - Brandon 24 Sesi', 'Rp 520.000', 'images/home-image/personal-trainer/Trainer3.png'),
    CartItem('Kelas Olahraga - 8 Sesi', 'Rp 520.000', 'images/home-image/membership/yoga.png'),
    CartItem('Alat Gym - Kettlebells 8kg', 'Rp 20.000', 'images/home-image/alat-gym/kettlebells-8kg.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), color: Colors.white,
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: Text(
          'Keranjang',
          style: TextStyle(color:Colors.white),
        ), 
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(cartItems[index]);
              },
            ),
          ),
          BottomBar(),
        ],
      ),
    );
  }
}

class CartItem {
  final String title;
  final String price;
  final String image;

  CartItem(this.title, this.price, this.image);
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  CartItemWidget(this.item);

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
          Checkbox(value: true, onChanged: (value) {}),
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
                onPressed: () {},
              ),
              Text('1', style: TextStyle(fontSize: 16)),
              IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(value: true, onChanged: (value) {}),
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
                'Rp 2.500.000',
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
              style: TextStyle(color:Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
