import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:table_calendar/table_calendar.dart';

class Jadwal extends StatefulWidget {
  const Jadwal({super.key});

  @override
  State<Jadwal> createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  DateTime today = DateTime.now();
  Map<DateTime, List<Map<String, dynamic>>> activities =
      {}; // Store activity with creation time

  @override
  void initState() {
    super.initState();
    _startNFCReading(); // Start NFC reading when the app starts
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  void _addActivity(DateTime date, String activity) {
    setState(() {
      if (activities[date] != null) {
        activities[date]!.add({
          'activity': activity,
          'createdAt': DateTime.now(),
          'finishAt': null, // This will be set later
        });
      } else {
        activities[date] = [
          {
            'activity': activity,
            'createdAt': DateTime.now(),
            'finishAt': null,
          }
        ];
      }
    });
  }

  // NFC Reading Logic
  void _startNFCReading() async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();

      if (isAvailable) {
        NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async {
            // When NFC tag is discovered, automatically add the "Hadir" activity.
            _addActivity(today, "Hadir");

            // Stop NFC session after tag is read
            NfcManager.instance.stopSession();
          },
        );
      } else {
        debugPrint('NFC not available.');
      }
    } catch (e) {
      debugPrint('Error reading NFC: $e');
    }
  }

  void _showActivityDetail(
      BuildContext context, Map<String, dynamic> activityData) {
    final DateTime createdAt = activityData['createdAt'];
    final DateTime? finishAt = activityData['finishAt'];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        title: const Text(
          'Activity Detail',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Activity: ${activityData['activity']}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              'Created At: ${createdAt.toString()}',
              style: const TextStyle(color: Colors.white),
            ),
            if (finishAt != null)
              Text(
                'Finished At: ${finishAt.toString()}',
                style: const TextStyle(color: Colors.white),
              )
            else
              const Text(
                'Finish the activity by clicking the "Finish" button.',
                style: TextStyle(color: Colors.white),
              ),
          ],
        ),
        actions: [
          if (finishAt == null)
            TextButton(
              onPressed: () {
                setState(() {
                  activityData['finishAt'] = DateTime.now();
                });
                Navigator.pop(context);
              },
              child: const Text(
                'Finish',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Jadwal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                        'images/FotoProfil.png'), // Replace with your asset path
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'You have a 1 week streak going!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TableCalendar(
                locale: "en_US",
                rowHeight: 60,
                focusedDay: today,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                selectedDayPredicate: (day) => isSameDay(day, today),
                onDaySelected: _onDaySelected,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  leftChevronIcon:
                      Icon(Icons.chevron_left, color: Colors.white),
                  rightChevronIcon:
                      Icon(Icons.chevron_right, color: Colors.white),
                ),
                calendarStyle: CalendarStyle(
                  defaultTextStyle: const TextStyle(color: Colors.white),
                  weekendTextStyle: const TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: const TextStyle(color: Colors.white),
                  outsideTextStyle: const TextStyle(color: Colors.grey),
                  disabledTextStyle: const TextStyle(color: Colors.grey),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.white),
                  weekendStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _showAddActivityDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: const Text(
                'Add Activity',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Detail',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: activities[today]?.map((activityData) {
                      return ListTile(
                        title: Text(
                          activityData['activity'],
                          style: const TextStyle(color: Colors.white),
                        ),
                        onTap: () => _showActivityDetail(context, activityData),
                      );
                    }).toList() ??
                    [
                      const Text('No activities',
                          style: TextStyle(color: Colors.grey))
                    ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddActivityDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        title: const Text(
          'Add Activity',
          style: TextStyle(color: Colors.white),
        ),
        content: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Activity Name',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                _addActivity(today, controller.text);
              }
              Navigator.pop(context);
            },
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }
}
