import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubes_pbp_gym/view/beranda/review_trainer/index_review.dart';
import 'package:tubes_pbp_gym/data/trainer_data.dart';
import 'package:tubes_pbp_gym/models/personal_trainer.dart';
import 'package:tubes_pbp_gym/view/beranda/cart/cart.dart';
import 'package:tubes_pbp_gym/models/items_cart.dart';
import 'package:tubes_pbp_gym/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class PersonalTrainerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      itemCount: trainers.length,
      itemBuilder: (context, index) {
        final Trainer trainer = trainers[index];

        return PersonalTrainerCard(
          trainer: trainer,
        );
      },
    );
  }
}

class PersonalTrainerCard extends StatefulWidget {
  final Trainer trainer;

  PersonalTrainerCard({required this.trainer});

  @override
  _PersonalTrainerCardState createState() => _PersonalTrainerCardState();
}

class _PersonalTrainerCardState extends State<PersonalTrainerCard> {
  String selectedSession = "4 Sesi";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Trainer Image, Name, and Price
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      widget.trainer.imagePath,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.trainer.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.trainer.duration,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.trainer.specialization,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Harga: Rp ${widget.trainer.price}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                widget.trainer.description,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              // Review & Instagram section
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadReview(),
                        ),
                      );
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.chat, color: Colors.white),
                        SizedBox(width: 4),
                        Text("23", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                        size: 22,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.trainer.email,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Session selection and add to cart
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: selectedSession,
                    items: ["4 Sesi", "8 Sesi", "12 Sesi", "24 Sesi"]
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(color: Colors.grey)),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSession = value!;
                      });
                    },
                    dropdownColor: Colors.grey[800],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      double totalPrice;

                      // Hitung total harga berdasarkan sesi yang dipilih
                      switch (selectedSession) {
                        case "4 Sesi":
                          totalPrice = widget.trainer.price * 4;
                          break;
                        case "8 Sesi":
                          totalPrice = widget.trainer.price * 8;
                          break;
                        case "12 Sesi":
                          totalPrice = widget.trainer.price * 12;
                          break;
                        case "24 Sesi":
                          totalPrice = widget.trainer.price * 24;
                          break;
                        default:
                          totalPrice = widget.trainer.price;
                      }

                      // Membuat item keranjang
                      final cartItem = CartItem(
                        title: widget.trainer.title,
                        price: totalPrice,
                        image: widget.trainer.imagePath,
                        membershipTitle:
                            'Trainer - ${widget.trainer.title} ($selectedSession)',
                        type: CartItemType.trainer,
                      );

                      // Menambahkan item ke keranjang menggunakan CartProvider
                      Provider.of<CartProvider>(context, listen: false)
                          .addItem(cartItem);

                      // Menampilkan SnackBar sebagai notifikasi popup
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Trainer ${widget.trainer.title} berhasil ditambahkan ke keranjang!',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'Lihat Keranjang',
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartPage(),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF673296),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Pilih",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
