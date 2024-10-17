import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Success"),
        backgroundColor:Color.fromRGBO(120, 157, 188, 4),
      ),
      backgroundColor:Color.fromRGBO(255, 236, 242, 4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.green,
            ),
            Text(
              "KYC Submission Successful",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text("Go Home"),
            ),
          ],
        ),
      ),
    );
  }
}
