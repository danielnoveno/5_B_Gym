import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:tubes_pbp_gym/entitiy/Pelanggan.dart';
import 'package:tubes_pbp_gym/client/PelangganClient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_pbp_gym/models/items_cart.dart';

class InvoicePdfGenerator {
  Future<Uint8List> generateInvoice(Pelanggan pelanggan, List<CartItem> cartItems) async {
    final pdf = pw.Document();

    final ByteData bytes = await rootBundle.load('images/gym.png');
    final Uint8List logoData = bytes.buffer.asUint8List();

    final pageFormat = PdfPageFormat.a4.copyWith(
      marginTop: 1 * PdfPageFormat.cm,
      marginBottom: 1 * PdfPageFormat.cm,
      marginLeft: 0.5 * PdfPageFormat.cm,
      marginRight: 0.5 * PdfPageFormat.cm,
    );

    pdf.addPage(
      pw.Page(
        pageFormat: pageFormat,
        build: (pw.Context context) {
          return pw.Container(
            padding: const pw.EdgeInsets.all(24),
            child: pw.Stack(
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Image(pw.MemoryImage(logoData), height: 80),
                      ],
                    ),
                    pw.SizedBox(height: 8),
                    pw.Text('Invoice 0069',
                        style: pw.TextStyle(
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black)),
                    pw.SizedBox(height: 8),
                    pw.Divider(
                      color: PdfColors.black,
                      thickness: 1,
                    ),
                    pw.SizedBox(height: 16),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('Pembelian: Symsala-GYM',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ],
                        ),
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('Tanggal Nota: Rabu, 01 Sep 2024'),
                            pw.Text('Jatuh Tempo: -'),
                          ],
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 16),
                    pw.Divider(
                      color: PdfColors.black,
                      thickness: 1,
                    ),
                    pw.SizedBox(height: 16),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        // Bagian "Dari"
                        pw.Expanded(
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Dari',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold)),
                              pw.Text('SymsalaGym Studio'),
                              pw.Text(
                                  'Jalan Bunga Matahari, Mekar ditaman No. 80, Daerah Istimewa Yogyakarta, Indonesia'),
                              pw.Text('+62 76442 2424 5222'),
                              pw.Text('symsalagym@studio.id'),
                            ],
                          ),
                        ),

                        // Bagian "Kepada"
                        pw.Expanded(
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                              pw.Text('Kepada',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold)),
                              pw.Text(pelanggan.nama),
                              pw.Text(pelanggan.alamat),
                              pw.Text(pelanggan.noTelepon),
                              pw.Text(pelanggan.email),
                            ],
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 24),
                    pw.Divider(
                      color: PdfColors.black,
                      thickness: 1,
                    ),
                    pw.SizedBox(height: 16),
                    pw.Table(
                      border: pw.TableBorder(
                        horizontalInside: pw.BorderSide(color: PdfColors.black),
                      ),
                      children: [
                        pw.TableRow(
                          children: [
                            _tableHeader('Layanan'),
                            _tableHeader('Jumlah'),
                            _tableHeader('Durasi'),
                            _tableHeader('Total'),
                          ],
                        ),
                        ...cartItems.map((item ) {
                          return _buildTableRow(
                            item.membershipTitle,
                            item.quantity.toString(),
                            item.title,
                            'Rp ${item.price * item.quantity}',
                          );
                        }).toList(),
                        pw.TableRow(
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(8),
                              child: pw.Text('Jumlah Total',
                                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                            ),
                            pw.SizedBox(),
                            pw.SizedBox(),
                            pw.SizedBox(),
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(8),
                              child: pw.Text(
                                'Rp ${cartItems.fold(0.0, (total, item) => total + (item.price * item.quantity)).toInt()}',
                                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 16),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      children: [
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Row(
                              children: [
                                pw.Text('Jumlah Total: ',
                                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                                pw.Text('Rp ${cartItems.fold(0.0, (total, item) => total + (item.price * item.quantity)).toInt()}'),
                              ],
                            ),
                            pw.Row(
                              children: [
                                pw.Text('Diskon: '),
                                pw.Text('-'),
                              ],
                            ),
                            pw.Row(
                              children: [
                                pw.Text('Jumlah Total: ',
                                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                                pw.Text('Rp ${cartItems.fold(0.0, (total, item) => total + (item.price * item.quantity)).toInt()}'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 16),
                  ],
                ),
                pw.Align(
                  alignment: pw.Alignment.bottomLeft,
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(10),
                    child: pw.BarcodeWidget(
                      data: 'https://symsalagym.com',
                      barcode: pw.Barcode.qrCode(),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _tableHeader(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.fromLTRB(16, 8, 8, 8),
      child: pw.Text(text, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
    );
  }

  pw.TableRow _buildTableRow(String layanan, String jumlah,
      String durasi, String total) {
    return pw.TableRow(
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Text(layanan),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: pw.Text(jumlah),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.fromLTRB(16, 8, 0, 8),
          child: pw.Text(durasi),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.fromLTRB(16, 8, 0, 8),
          child: pw.Text(total),
        ),
      ],
    );
  }
}

class PdfInvoicePage extends StatelessWidget {
  final List<CartItem> cartItems;

  PdfInvoicePage({required this.cartItems});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice PDF"),
      ),
      body: FutureBuilder<Pelanggan>(
        future: _fetchProfile(), // Fetch the profile data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          } else {
            Pelanggan pelanggan = snapshot.data!;

            return FutureBuilder<Uint8List>(
              future: InvoicePdfGenerator().generateInvoice(pelanggan, cartItems),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return Center(child: Text('No data available'));
                } else {
                  return PdfPreview(
                    build: (format) => snapshot.data!,
                  );
                }
              },
            );
          }
        },
      ),
    );
  }

  Future<Pelanggan> _fetchProfile() async {
    final prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');

    if (userId == null) {
      throw Exception('User  not logged in');
    }

    return await PelangganClient.find(userId);
  }
}