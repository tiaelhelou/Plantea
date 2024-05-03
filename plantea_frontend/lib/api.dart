import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static String urlbase = 'http://127.0.0.1:8000/api/v1';

  /*
   * Sign up api
   */
  static Future<bool> registerUser(
      String name, String email, String password) async {
    final url = Uri.parse('$urlbase/authentication/register');
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

      if (response.statusCode == 201) {
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

  /*
   * Login api
   */
  static Future<bool> loginUser(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
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
        final responseData = await json.decode(response.body);
        final token = responseData['access_token'];

        await saveTokenToLocalStorage(token!);

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

  static Future<void> saveTokenToLocalStorage(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<void> saveIdToLocalStorage(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', id);
  }
}
