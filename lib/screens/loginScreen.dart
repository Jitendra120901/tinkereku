import 'package:flutter/material.dart';
import 'package:tinkereku/ApiHandler/apiWrapper.dart';
import 'package:tinkereku/ApiHandler/networkConstant.dart';
import 'package:tinkereku/UiHelper/uiHelper.dart';
import 'package:tinkereku/controllers/authController.dart';
import 'package:tinkereku/screens/forgetPasswordScreen.dart';
import 'package:tinkereku/screens/homeScreen.dart';
import 'package:tinkereku/screens/singupScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png', // Add an educational icon here
                height: 100,
              ),
              SizedBox(height: 20),
              Text(
                'Log in to continue your learning journey',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email *',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password *',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      Text('Remember me'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ForgotPasswordScreen();
                      }));
                    },
                    child: Text('Lost your password?'),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF3b82f6), Color(0xFFa855f7)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    verifyEnteredData(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignUpScreen();
                  }));
                },
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    children: [
                      TextSpan(
                        text: 'Signup',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyEnteredData(BuildContext context) async {
  if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
  Uihelper().showLoaderDialog(context, "Logging in...");

    var params = {
      "userdet": emailController.text.trim().toString(),
      "passkey": passwordController.text.trim().toString()
    };

    try {
      // Await the result of the login API call
      final ApiResponse? result =
          await AuthControllers.post(NetworkConstantsUtil.login, params);
      Navigator.pop(context);

      if (result?.success == "true") {
        print(
            "post api data after api call =====================> ${result?.success}");
        // Accessing specific fields in the response
        final data = result?.data;

        // Navigate to DashboardScreen if login is successful
        if (data != null && data.isNotEmpty) {
          final userID = data[0]['UserID'];
          final userRole = data[0]['UserRole'];
          final username=data[0]["Name"];

          // Save UserID and UserRole in shared preferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('UserID', userID);
          await prefs.setString('UserRole', userRole);
          await prefs.setString('UserName', username);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
              ),
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${result?.message}', // Updated to access the correct index and key
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
        print(
            "post api data after api call on error=====================> ${result?.success}");
        // Show error message if login failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed. ${result?.message}.'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } catch (e) {
      // Handle any errors that occur during the API call
      Navigator.pop(context);
      print("Error during login: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again.'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  } else {
    // Show error message if fields are empty
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email and password cannot be empty'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}

 
}