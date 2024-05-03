import 'dart:convert';
import 'package:http/http.dart' as http;


class Api {
  const url= ''
  /*
   * Login api
   */
  static Future<String?> loginUser(String email, String password) async {
    final url = Uri.parse(
        'https://example.com/api/login'); // Replace with your API endpoint for login
    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
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
        return token;
      } else {
        print('Login failed with status: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error logging in: $error');
      return null;
    }
  }

  static Future<bool> registerUser(
      String name, String email, String password) async {
    final url = Uri.parse(
        'https://example.com/api/register'); // Replace with your API endpoint for registration
    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'password': password,
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
        return true;
      } else {
        print('Registration failed with status: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error registering user: $error');
      return false;
    }
  }
}
