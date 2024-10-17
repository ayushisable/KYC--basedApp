import 'package:flutter/material.dart';
import 'id_verification_screen.dart';

class PersonalDetailScreen extends StatefulWidget {
  @override
  _PersonalDetailScreenState createState() => _PersonalDetailScreenState();
}

class _PersonalDetailScreenState extends State<PersonalDetailScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();

  String _selectedGender = 'Male';

  void _navigateToVerificationScreen() {
    if (_nameController.text.isEmpty || _nationalityController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please fill out all the fields'),
      ));
      return;
    }

    // Navigate to the ID verification screen with personal details as arguments
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IDVerificationScreen(
          name: _nameController.text,
          nationality: _nationalityController.text,
          gender: _selectedGender,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Details'),
        backgroundColor:Color.fromRGBO(120, 157, 188, 4),
      ),

      backgroundColor:Color.fromRGBO(255, 236, 242, 4),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Enter your personal details:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nationalityController,
              decoration: InputDecoration(
                labelText: 'Nationality',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('Gender:'),
            Row(
              children: <Widget>[
                Radio<String>(
                  value: 'Male',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                Text('Male'),
                Radio<String>(
                  value: 'Female',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                Text('Female'),
                Radio<String>(
                  value: 'Other',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                Text('Other'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToVerificationScreen,
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
