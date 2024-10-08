import 'package:flutter/material.dart';



class InstructorApplicationPage extends StatelessWidget {
  final LinearGradient gradient = LinearGradient(
    colors: [Color(0xFF3b82f6), Color(0xFFa855f7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: gradient,
            ),
          ),
          title: Text('Apply As Instructor', style: TextStyle(color: Colors.white),),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Text(
                  'Apply As Instructor',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Lorem ipsum dolor sit amet, consectetur.'),
                SizedBox(height: 16),
                TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.blue,
                  indicatorWeight: 2.0,
                  tabs: [
                    Tab(text: 'Become an Instructor'),
                    Tab(text: 'Instructor Rules'),
                    Tab(text: 'Start with courses'),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  height: 200,
                  child: TabBarView(
                    children: [
                      Text(
                        'Educational technology ipsum dolor sit amet consectetur, adipisicing elit. Tempora sequi doloremque dicta quia unde odio nam minus reiciendis ullam aliquam, dolorum ab quisquam cum numquam nemo iure cumque iste. Accusamus necessitatibus.',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Physical education ipsum dolor sit amet consectetur adipscing elit. Tempus vesrsu dolormagna data quis unda odo eirm matris mnesrntius ultoi eiram, debitum eu cuquam camn mumquam nemo lam cursus iate. Ad eosamaeu extei tribus.',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Experiencing music ipsum dolor sit amet consectetur, adipisicing elit. Tempora sequi doloremque dicta quia unde odio nam minus reiciendis ullam aliquam, dolorum ab quisquam cum numquam nemo iure cumque iste. Accusamus necessitatibus.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
               
                MediaQuery.of(context).size.width > 800
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Image.network(
                                'https://via.placeholder.com/300',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 32),
                          Expanded(
                            flex: 2,
                            child: _buildForm(),
                          ),
                        ],
                      )
                    : _buildForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildGradientButton('For Become an Instructor'),
      SizedBox(height: 16),
      Text(
        'Instructor Registration',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 16),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Full Name',
          prefixIcon: Icon(Icons.person), // Icon for Full Name
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 16),
      TextFormField(
        decoration: InputDecoration(
          labelText: '10 Digit Mobile No.',
          prefixIcon: Icon(Icons.phone), // Icon for Mobile No.
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 16),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Email',
          prefixIcon: Icon(Icons.email), // Icon for Email
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 16),
      TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock), // Icon for Password
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 16),
      TextFormField(
        maxLines: 3, // Example for multiline input
        decoration: InputDecoration(
          labelText: 'About Mentor',
          prefixIcon: Icon(Icons.info), // Icon for About Mentor
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 16),
      Row(
        children: [
          _buildGradientButton('Choose File'),
          SizedBox(width: 8),
          Text('No file chosen'),
        ],
      ),
      SizedBox(height: 16),
      Row(
        children: [
          Checkbox(value: false, onChanged: (bool? value) {}),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Send me special offers, personalized recommendations, and learning tips.',
            ),
          ),
        ],
      ),
      SizedBox(height: 16),
      Center(
        child: _buildGradientButton('Submit'),
      ),
    ],
  );
}

  Widget _buildGradientButton(String text) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
