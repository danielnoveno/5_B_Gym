import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/entitiy/Jadwal.dart';
import 'package:tubes_pbp_gym/client/JadwalClient.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:table_calendar/table_calendar.dart';

class Jadwal extends StatefulWidget {
  const Jadwal({super.key});

  @override
  State<Jadwal> createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  DateTime today = DateTime.now();
  Map<DateTime, List<Activity>> activities =
      {}; // Store activities with DateTime as key

  @override
  void initState() {
    super.initState();
    _fetchActivities(); // Fetch activities from API
    _startNFCReading(); // Start NFC reading when the app starts
  }

  // Fetch all activities from the API
  void _fetchActivities() async {
    try {
      List<Activity> fetchedActivities = await ActivityClient.fetchAll();
      setState(() {
        activities = _groupActivitiesByDate(fetchedActivities);
      });
    } catch (e) {
      debugPrint('Error fetching activities: $e');
    }
  }

  // Group activities by their date
  Map<DateTime, List<Activity>> _groupActivitiesByDate(
      List<Activity> activities) {
    Map<DateTime, List<Activity>> groupedActivities = {};
    for (var activity in activities) {
      DateTime date = DateTime.parse(activity.date);
      if (groupedActivities[date] == null) {
        groupedActivities[date] = [];
      }
      groupedActivities[date]!.add(activity);
    }
    return groupedActivities;
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  void _addActivity(DateTime date, String activityName) async {
    // Create activity with finishAt set to null initially
    Activity newActivity = Activity(
      id: 0, // ID sementara sampai dibuat di API
      activity: activityName,
      finishAt: DateTime.now(),
      date: date.toIso8601String(),
      createdAt: DateTime.now(), // Set createdAt to current time
      updatedAt: DateTime.now(),
    );

    try {
      var response = await ActivityClient.create(newActivity);
      if (response.statusCode == 201) {
        // After activity is created, update its ID from API response
        var createdActivity =
            Activity.fromJson(json.decode(response.body)['data']);
        setState(() {
          setState(() {
            if (activities[date] == null) {
              activities[date] = [];
            }
            activities[date]!.add(createdActivity);
          });
        });
      }
    } catch (e) {
      debugPrint('Error adding activity: $e');
    }
  }

// NFC Reading Logic
  void _startNFCReading() async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();
      if (isAvailable) {
        NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async {
            // Tandai aktivitas sebagai hadir ketika NFC terbaca
            _addActivity(today, "Hadir");

            // Cari aktivitas berdasarkan tanggal
            List<Activity>? activitiesToday = activities[today];
            if (activitiesToday != null && activitiesToday.isNotEmpty) {
              Activity activity =
                  activitiesToday.first; // Ambil aktivitas pertama
              activity.finishAt =
                  DateTime.now(); // Set finishAt dengan waktu sekarang
              // Update aktivitas di API setelah NFC terbaca
              try {
                var response = await ActivityClient.update(activity);
                if (response.statusCode == 200) {
                  setState(() {
                    activities[today]![activitiesToday.indexOf(activity)] =
                        activity;
                  });
                }
              } catch (e) {
                debugPrint('Error finishing activity: $e');
              }
            }
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

// Show activity detail and enable finishing the activity
  void _showActivityDetail(BuildContext context, Activity activity, int index) {
    final DateTime createdAt = activity.createdAt;
    final DateTime? finishAt = activity.finishAt;

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
              'Activity: ${activity.activity}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              'Created At: ${createdAt.toString()}',
              style: const TextStyle(color: Colors.white),
            ),
            // Show finishAt only if it's not null
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
          if (finishAt == null) // Only show finish button if finishAt is null
            TextButton(
              onPressed: () async {
                if (activity.id == 0) {
                  debugPrint('Invalid activity ID');
                  return;
                }
                // Set finishAt when the activity is finished
                activity.finishAt = DateTime.now();
                try {
                  var updatedActivity = await ActivityClient.update(activity);
                  if (updatedActivity.statusCode == 200) {
                    setState(() {
                      activities[today]![index] = activity;
                    });
                    Navigator.pop(context);
                  } else {
                    debugPrint('Failed to finish activity.');
                  }
                } catch (e) {
                  debugPrint('Error finishing activity: $e');
                }
              },
              child:
                  const Text('Finish', style: TextStyle(color: Colors.purple)),
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
                children: activities[today]?.asMap().entries.map((entry) {
                      int index = entry.key;
                      Activity activity = entry.value;
                      return ListTile(
                        title: Text(
                          activity.activity,
                          style: const TextStyle(color: Colors.white),
                        ),
                        onTap: () =>
                            _showActivityDetail(context, activity, index),
                      );
                    }).toList() ??
                    [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Show dialog to add a new activity
  void _showAddActivityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String activityName = '';
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            'Add Activity',
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            onChanged: (value) {
              setState(() {
                activityName = value;
              });
            },
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Activity Name',
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
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
                if (activityName.isNotEmpty) {
                  _addActivity(today, activityName);
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        );
      },
    );
  }
}
