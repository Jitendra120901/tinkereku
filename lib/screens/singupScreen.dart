import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/logo.png', // Add an educational icon here
                  height: 100,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Sign up and start learning',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Full Name *',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                      prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  
                  decoration: InputDecoration(
                    labelText: '10 Digit Mobile No. *',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                      prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email *',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                      prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password *',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                      prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (bool? value) {},
                    ),
                    Expanded(
                      child: Text(
                        'Send me special offers, personalized recommendations, and learning tips.',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF3b82f6), Color(0xFFa855f7)], // Gradient colors to match login page
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      
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
                      'Sign up',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'By signing up, you agree to our Terms of Use and Privacy Policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0),
                ),
                SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) {
                      return route.isFirst;
                    },);
                  },
                  child: Text(
                    'Already have an account? Log in',
                    style: TextStyle(color: Color(0xFF3b82f6)), // Matching color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
