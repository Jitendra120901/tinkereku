import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinkereku/ApiHandler/apiWrapper.dart';
import 'package:tinkereku/ApiHandler/networkConstant.dart';
import 'package:tinkereku/UiHelper/uiHelper.dart';
import 'package:tinkereku/controllers/authController.dart';

class AllEvents extends StatefulWidget {
  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  List<EventItem> items = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() => loadAllEvents(context));
  }

  Future<void> loadAllEvents(BuildContext context) async {
    Uihelper().showLoaderDialog(context, "Loading...");

    try {
      final ApiResponse? result = await AuthControllers.commonforGetApicall(
          NetworkConstantsUtil.getAllEvents);
      Navigator.pop(context);

      if (result?.success == "true") {
        final data = result?.data;
        if (data != null && data.isNotEmpty) {
          setState(() {
            items = data.map<EventItem>((json) => EventItem.fromJson(json)).toList();
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${result?.message}',
                style: TextStyle(color: Colors.black),
              ),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.greenAccent,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid response from the server.'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Loading events failed. ${result?.message}.'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);
      print("Error during loading events: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again.'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3b82f6), Color(0xFFa855f7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          'All Events',
          style: TextStyle(color: Colors.white), // Changed to white to contrast with the gradient
        ),
      ),
      body: items.isEmpty
          ? Center(child: Text('No events available.'))
          : ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return EventCard(item: items[index]);
              },
            ),
    );
  }
}

class EventItem {
  final String imageUrl;
  final String title;
  final String description;
  final String duration;
  final String date;
  final String address;
  final String time;
  final String fees;
  final String contact;

  EventItem({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.duration,
    required this.date,
    required this.address,
    required this.time,
    required this.fees,
    required this.contact,
  });

  factory EventItem.fromJson(Map<String, dynamic> json) {
    return EventItem(
      imageUrl: json['Picture'],
      title: json['EvntTitle'],
      description: json['EvntDesc'],
      duration: json['EvntDuration'],
      date: json['EvntDate'],
      address: json['EvntAddr'],
      time: json['EvntTime'],
      fees: json['EvntFees'],
      contact: json['EvntContact'],
    );
  }
}

class EventCard extends StatelessWidget {
  final EventItem item;

  const EventCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(item.imageUrl, fit: BoxFit.cover, height: 200, width: double.infinity,),
              ),
              if (item.fees != 'Free')
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '40% Off',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 16),
                SizedBox(width: 5),
                Text('15 Reviews', style: TextStyle(color: Colors.orange, fontSize: 14)),
                Spacer(),
                Icon(Icons.bookmark_border, color: Colors.grey, size: 20),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(Icons.timer, size: 14),
                SizedBox(width: 5),
                Text(item.duration),
                SizedBox(width: 15),
                Icon(Icons.person, size: 14),
                SizedBox(width: 5),
                Text('50 Students'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Text(
              item.description,
              style: TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Text(
              'By Admin In Category 4',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹${item.fees}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Learn More'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
