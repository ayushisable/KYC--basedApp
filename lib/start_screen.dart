import 'package:flutter/material.dart';
import 'personal_detail_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to the KYC Process'),
        centerTitle: true,
        backgroundColor:Color.fromRGBO(120, 157, 188, 4),



      ),
      backgroundColor:Color.fromRGBO(255, 236, 242, 4),
      body: Center(
        child:
         ElevatedButton(
          onPressed: () {
            // Navigate to the Personal Details screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PersonalDetailScreen(),
              ),
            );
          },
          child: Text('Start KYC Process'),
        ),
      ),
    );
  }
}
