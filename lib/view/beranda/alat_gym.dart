import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/client/AlatGymClient.dart';
import 'package:tubes_pbp_gym/entitiy/AlatGym.dart';

class GymEquipmentView extends StatefulWidget {
  @override
  _GymEquipmentViewState createState() => _GymEquipmentViewState();
}

class _GymEquipmentViewState extends State<GymEquipmentView> {
  late Future<List<GymEquipment>> _gymEquipments;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<GymEquipment> _localEquipments = [];

  @override
  void initState() {
    super.initState();
    _gymEquipments = GymEquipmentClient.fetchAll();
    _gymEquipments.then((equipments) {
      setState(() {
        _localEquipments = equipments;
      });
    });
  }

  void _updateQuantity(int index, int quantity) {
    setState(() {
      _localEquipments[index].quantity = quantity;
    });
  }

  double _calculateTotalPrice(List<GymEquipment> gymEquipments) {
    double totalPrice = 0.0;
    for (var equipment in gymEquipments) {
      totalPrice += (equipment.harga.toDouble() * equipment.quantity);
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _localEquipments.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _localEquipments.length,
                    itemBuilder: (context, index) {
                      var gymEquipment = _localEquipments[index];
                      return Card(
                        color: Colors.grey[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            gymEquipment.imagePath ??
                                'assets/images/placeholder.png',
                            width: 50,
                            height: 50,
                          ),
                          title: Text(
                            gymEquipment.namaAlat,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                gymEquipment.deskripsi,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white70,
                                ),
                              ),
                              Text(
                                'Rp ${gymEquipment.harga.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove,
                                    color: Colors.white),
                                onPressed: () {
                                  if (gymEquipment.quantity > 0) {
                                    _updateQuantity(
                                        index, gymEquipment.quantity - 1);
                                  }
                                },
                              ),
                              Text(
                                '${gymEquipment.quantity}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.add, color: Colors.white),
                                onPressed: () {
                                  _updateQuantity(
                                      index, gymEquipment.quantity + 1);
                                },
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      );
                    },
                  ),
                ),
                Card(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rp ${_calculateTotalPrice(_localEquipments).toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF673296),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Masukkan Keranjang",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
