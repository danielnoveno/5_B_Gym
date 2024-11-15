import 'package:flutter/material.dart';

void main() {
  runApp(NotificationApp());
}

class NotificationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationItem> todayNotifications = [
    NotificationItem(
      title: 'Reminder! Jangan Lupa Jadwal Latihan Besok',
      content:
          'Halo! Kami ingin mengingatkan bahwa kamu memiliki jadwal latihan di Healthy Club besok. Pastikan kamu mempersiapkan diri dengan baik agar bisa berlatih maksimal dan mencapai tujuan kebugaranmu.',
      date: '11:05',
      isRead: false,
    ),
    NotificationItem(
      title: 'Saatnya Beraksi! Waktunya Latihan!',
      content:
          'Semangat, sekarang waktunya untuk bergerak! Latihanmu di Healthy Club sudah dimulai. Jadikan sesi ini sebagai langkah menuju tubuh yang lebih sehat dan kuat. Jangan lupa lakukan pemanasan sebelum memulai, dan selalu fokus pada teknik agar latihan lebih efektif.',
      date: '11:05',
      isRead: false,
    ),
  ];

  List<NotificationItem> weekNotifications = [
    NotificationItem(
      title: 'Sesi Latihan Bersama Personal Trainer',
      content:
          'Sesi latihanmu dengan personal trainer sudah dijadwalkan untuk besok. Ini adalah kesempatan emas untuk mendapatkan bimbingan langsung dari profesional! Pastikan kamu sudah mempersiapkan pertanyaan atau area yang ingin kamu tingkatkan.',
      date: 'Kemarin 12:05',
      isRead: true,
    ),
    NotificationItem(
      title: 'Pembayaran Berhasil Diproses!',
      content:
          'Terima kasih telah menyelesaikan pembayaranmu. Kami telah memprosesnya dengan sukses, dan semua layanan yang kamu pilih kini aktif dan siap untuk digunakan. Tetap semangat berlatih!',
      date: 'Kemarin 15:05',
      isRead: true,
    ),
    NotificationItem(
      title: 'Spesial Diskon Membership untuk Kamu!',
      content:
          'Ada kabar baik! Kami sedang mengadakan promo spesial untuk membership baru maupun perpanjangan. Ini kesempatan terbaik bagi kamu yang ingin terus aktif di Healthy Club dengan harga yang lebih hemat.',
      date: '13-11-2024 15:00',
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Notifikasi',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          SectionTitle(title: 'Hari ini'),
          ...todayNotifications
              .map((notif) => NotificationCard(notification: notif)),
          SectionTitle(title: 'Minggu ini'),
          ...weekNotifications
              .map((notif) => NotificationCard(notification: notif)),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String content;
  final String date;
  final bool isRead;

  NotificationItem({
    required this.title,
    required this.content,
    required this.date,
    this.isRead = true,
  });
}

class NotificationCard extends StatefulWidget {
  final NotificationItem notification;

  NotificationCard({required this.notification});

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.notification.isRead ? Color(0xFF361A4F) : Color(0xFF673296),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (!widget.notification.isRead)
                  Container(
                    margin: EdgeInsets.only(right: 8.0),
                    width: 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF361A4F),
                      shape: BoxShape.circle,
                    ),
                  ),
                Expanded(
                  child: Text(
                    widget.notification.title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              isExpanded
                  ? widget.notification.content
                  : widget.notification.content.substring(0, 50) + '...',
              style: TextStyle(fontSize: 14, color: Colors.grey[200]),
              textAlign: TextAlign.justify,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.notification.date,
                  style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                ),
                IconButton(
                  icon: Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
