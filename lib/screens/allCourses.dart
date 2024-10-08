import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinkereku/ApiHandler/apiWrapper.dart';
import 'package:tinkereku/ApiHandler/networkConstant.dart';
import 'package:tinkereku/UiHelper/uiHelper.dart';
import 'package:tinkereku/controllers/authController.dart';

class AllCourses extends StatefulWidget {
  @override
  State<AllCourses> createState() => _AllCoursesState();
}

class _AllCoursesState extends State<AllCourses> {
  List<CardItem> items = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() => loadAllCourses(context));
  }

  Future<void> loadAllCourses(BuildContext context) async {
    Uihelper().showLoaderDialog(context, "Loading...");

    try {
      final ApiResponse? result = await AuthControllers.commonforGetApicall(
          NetworkConstantsUtil.getAllCourses);
      Navigator.pop(context);

      if (result?.success == "true") {
        final data = result?.data;
        if (data != null && data.isNotEmpty) {
          setState(() {
            items =
                data.map<CardItem>((json) => CardItem.fromJson(json)).toList();
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
            content: Text('Loading courses failed. ${result?.message}.'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);
      print("Error during loading courses: $e");
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
    'All Courses',
    style: TextStyle(color: Colors.white), // Changed to white to contrast with the gradient
  ),
)
,
      body: items.isEmpty
          ? Center(child: Text('No courses available.'))
          : ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CourseCard(item: items[index]);
              },
            ),
    );
  }
}

class CardItem {
  final String imageUrl;
  final String title;
  final String subtitle;
  final int reviews;
  final int modules;
  final int students;
  final String category;
  final String price;

  CardItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.reviews,
    required this.modules,
    required this.students,
    required this.category,
    required this.price,
  });

  factory CardItem.fromJson(Map<String, dynamic> json) {
    return CardItem(
      imageUrl: json['Picture'],
      title: json['CrseTitle'],
      subtitle: json['CrseLevel'],
      reviews: int.parse(json['Courserating']),
      modules: 6, // This value is not provided in the API response
      students: 50, // This value is not provided in the API response
      category: json['MainCat'],
      price: json['PriceStatus'] == 'free' ? 'Free' : json['DiscPrice'],
    );
  }
}

class CourseCard extends StatelessWidget {
  final CardItem item;

  const CourseCard({Key? key, required this.item}) : super(key: key);

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
                child: Image.network(item.imageUrl, fit: BoxFit.cover),
              ),
              if (item.price != 'Free')
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
            child: Text(
              item.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '⭐ ${item.reviews} Reviews',
              style: TextStyle(color: Colors.orangeAccent, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              children: [
                Icon(Icons.book, size: 14),
                SizedBox(width: 5),
                Text('${item.modules} Module'),
                SizedBox(width: 15),
                Icon(Icons.person, size: 14),
                SizedBox(width: 5),
                Text('${item.students} Students'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.subtitle,
              style: TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Text(
              'By Test In ${item.category}',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.price != 'Free' ? '₹${item.price}' : item.price,
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
