import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static String urlbase = 'http://127.0.0.1:8000/api/v1';
  /*
   * Login api
   */
  static Future<bool> loginUser(String email, String password) async {
    final url = Uri.parse(
        '$urlbase/authentication/login'); // Replace with your API endpoint for login

    final Map<String, dynamic> data = {
      'user_email': email,
      'user_password': password,
    };

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final token = responseData['token'] as String?;
        print('im here');
        return true;
      } else {
        print('Login failed with status: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error logging in: $error');
      return false;
    }
  }
}
