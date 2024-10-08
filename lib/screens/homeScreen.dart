import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinkereku/screens/addIntructor.dart';
import 'package:tinkereku/screens/allCourses.dart';
import 'package:tinkereku/screens/allEvents.dart';
import 'package:tinkereku/screens/profileScreen.dart';
import 'package:tinkereku/screens/searchDialog.dart';
import 'package:tinkereku/screens/shoppingCartDialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu,
                color: Colors
                    .white), // Changed to white to contrast with the gradient
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search,
                color: Colors
                    .white), // Changed to white to contrast with the gradient
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SearchScreen();
                },
              );
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart,
                    color: Colors
                        .white), // Changed to white to contrast with the gradient
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ShoppingCartScreen();
                    },
                  );
                },
              ),
              Positioned(
                right: 7,
                top: 7,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    '4',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.more_vert,
                color: Colors
                    .white), // Changed to white to contrast with the gradient
            onPressed: () {},
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.emoji_events, color: Colors.amber),
                    SizedBox(width: 8.0),
                    Text(
                      'The Leader in Online Learning',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Build The Skills To Drive Your Career.',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Velit officia consequat.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF3b82f6), Color(0xFFa855f7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View Course',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'COURSE CATEGORY',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Let the journey of organizing your own learning begin',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              CourseCategoryCard(
                imageUrl: 'assets/pl.jpg',
                title: 'Category 1',
                courses: '2 Courses',
              ),
              SizedBox(height: 20),
              CourseCategoryCard(
                imageUrl: 'assets/pl.jpg',
                title: 'Category 2',
                courses: '0 Courses',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270, // Set the drawer width to the full width of the screen
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF3b82f6), Color(0xFFa855f7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/logo.png', height: 60),
                  SizedBox(height: 10),
                  Text(
                    'Online Learning Platform',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10), // Space between the sections
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'info@tinkereku.com',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ProfileScreen();
                  },
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.subject),
              title: Text("All Courses"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AllCourses();
                  },
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.event_available),
              title: Text("Events"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AllEvents();
                  },
                ));
              },
            ),
            ExpansionTile(
              leading: Icon(Icons.price_change),
              title: Text("Plan & Pricing"),
              children: [
                ListTile(
                  title: Text("Option 1"),
                  onTap: () {
                    // Handle your tap here
                  },
                ),
                ListTile(
                  title: Text("Option 2"),
                  onTap: () {
                    // Handle your tap here
                  },
                ),
              ],
            ),
            // ExpansionTile(
            //   leading: Icon(Icons.subject),
            //   title: Text("All Courses"),
            //   children: [
            //     ListTile(
            //       title: Text("Course 1"),
            //       onTap: () {
            //         // Handle your tap here
            //       },
            //     ),
            //     ListTile(
            //       title: Text("Course 2"),
            //       onTap: () {
            //         // Handle your tap here
            //       },
            //     ),
            //   ],
            // ),
            ExpansionTile(
              title: Text("Programs"),
              leading: Icon(Icons.event),
              children: [
                ListTile(
                  title: Text("Abouts"),
                  onTap: () {
                    // Handle your tap here
                  },
                ),
                ListTile(
                  title: Text("Contact us"),
                  onTap: () {
                    // Handle your tap here
                  },
                ),
                ListTile(
                  title: Text("FAQs"),
                  onTap: () {
                    // Handle your tap here
                  },
                ),
                ListTile(
                  title: Text("Pravicy Policy"),
                  onTap: () {
                    // Handle your tap here
                  },
                ),
                ListTile(
                  title: Text("Academy Gallery"),
                  onTap: () {
                    // Handle your tap here
                  },
                ),
                ListTile(
                  title: Text("Admission Guid"),
                  onTap: () {
                    // Handle your tap here
                  },
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.contact_support),
              title: Text("Teach on TinkerEKU"),
              onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return InstructorApplicationPage();
                  },
                ));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1), // Light red background
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove('UserID');
                    prefs.remove('UserRole');
                    prefs.remove('UserName');

                    Navigator.popUntil(
                      context,
                      (route) {
                        return route.isFirst;
                      },
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "FIND WITH US",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.blue,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.twitter,
                    color: Color.fromARGB(255, 3, 92, 165),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.instagram,
                    color: const Color.fromARGB(255, 238, 133, 125),
                  ),
                  onPressed: () {
                    // Handle your tap here
                  },
                ),
                // IconButton(
                //   icon: Icon(Icons.linkeddin),
                //   onPressed: () {
                //     // Handle your tap here
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCategoryCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String courses;

  CourseCategoryCard({
    required this.imageUrl,
    required this.title,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  courses,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
