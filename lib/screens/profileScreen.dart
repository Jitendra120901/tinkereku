import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? userID;
  String? userName;
  String? userRole;
  String? userEmail = "jitendra2004@gmail.com"; // Dummy data
  String? userPhone = "9911364910"; // Dummy data

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userID = prefs.getString('UserID') ?? 'N/A';
      userName = prefs.getString('UserName') ?? 'N/A';
      userRole = prefs.getString('UserRole') ?? 'N/A';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 350, // Increased height to avoid image cutting
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF3b82f6), Color(0xFFa855f7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(40),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 80), // Increased space for AppBar
                    CircleAvatar(
                      radius: 60, // Increased radius for better visibility
                      backgroundImage: AssetImage('assets/profile.png'), // Replace with your profile image
                    ),
                    SizedBox(height: 10),
                    Text(
                      userName ?? 'Rachit Gupta',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      userRole ?? 'Developer & Designer',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      label: Text('Edit Profile'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blue,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.email, color: Colors.blue),
                    ),
                    controller: TextEditingController(text: userEmail),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      labelStyle: TextStyle(color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.phone, color: Colors.blue),
                    ),
                    controller: TextEditingController(text: userPhone),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
