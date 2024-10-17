import 'package:flutter/material.dart';
import 'verification_service.dart';

class IDVerificationScreen extends StatefulWidget {
  final String name;
  final String nationality;
  final String gender;

  IDVerificationScreen({
    required this.name,
    required this.nationality,
    required this.gender,
  });

  @override
  _IDVerificationScreenState createState() => _IDVerificationScreenState();
}

class _IDVerificationScreenState extends State<IDVerificationScreen> {
  final TextEditingController _idController = TextEditingController();
  String _verificationStatus = '';
  bool _isVerifying = false;

  Future<void> verifyID() async {
    setState(() {
      _isVerifying = true;
    });

    String idProofNumber = _idController.text.trim();

    if (idProofNumber.isEmpty) {
      setState(() {
        _verificationStatus = 'Please enter an ID proof number.';
        _isVerifying = false;
      });
      return;
    }

    try {
      var result = await VerificationService.verifyID(idProofNumber);

      setState(() {
        _verificationStatus = result ? 'ID is verified!' : 'ID verification failed.';
        _isVerifying = false;
      });
    } catch (e) {
      setState(() {
        _verificationStatus = 'Error verifying ID: $e';
        _isVerifying = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ID Proof Verification'),
        backgroundColor:Color.fromRGBO(120, 157, 188, 4),
      ),
      backgroundColor:Color.fromRGBO(255, 236, 242, 4),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Personal Details:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text('Name: ${widget.name}'),
            Text('Nationality: ${widget.nationality}'),
            Text('Gender: ${widget.gender}'),
            SizedBox(height: 20),
            Text(
              'Enter your ID proof number for verification:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: 'ID Proof Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            _isVerifying
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: verifyID,
              child: Text('Verify ID'),
            ),
            SizedBox(height: 20),
            Text(
              _verificationStatus,
              style: TextStyle(
                fontSize: 16,
                color: _verificationStatus.contains('failed') ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
