import 'dart:convert';
import 'package:http/http.dart' as http;
import 'success_screen.dart';

class VerificationService {
  static const String _apiUrl = 'https://in.staging.decentro.tech/synchronous/hyperstream-executor';

  static Future<bool> verifyID(String idProofNumber) async {
    try {
      var response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'idProofNumber': idProofNumber,
        }),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        return responseData['verified'] == true;
      } else {
        throw Exception('Failed to verify ID. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error connecting to the API: $e');
    }
  }
}
