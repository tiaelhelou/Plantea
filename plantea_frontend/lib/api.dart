import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static String urlbase = 'http://10.0.2.2:8000/api/v1';
  //for the emulaator : 'http://10.0.2.2:8000/api/v1';
  //for edge: 'http://127.0.0.1:8000/api/v1';

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
    final url = Uri.parse('$urlbase/authentication/login');

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
        final id = responseData['user']['user_id'];

        await saveTokenToLocalStorage(token!);
        await saveIdToLocalStorage(id!);

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

  /*
   * Save Token
   */
  static Future<void> saveTokenToLocalStorage(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  /*
   * Save Id
   */
  static Future<void> saveIdToLocalStorage(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', id);
  }

  /*
   * Save Image
   */
  static Future<void> saveImageToLocalStorage(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('path', path);
  }

  /*
   * Change password api
   */
  static Future<bool> changePassUser(
      String oldpassword, String newpassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt('id');

    final url = Uri.parse('$urlbase/authorization/user/changePassword/$id');

    final Map<String, dynamic> data = {
      'new_password': newpassword,
      'old_password': oldpassword,
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
        print('Change failed with status: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error : $error');
      return false;
    }
  }

  /*
   * Reset password api
   */
  static Future<bool> resetPassword(String email, String newpassword) async {
    final url = Uri.parse('$urlbase/authentication/resetPassword');

    final Map<String, dynamic> data = {
      'email': email,
      'new_password': newpassword,
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
        print('Reset failed with status: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error : $error');
      return false;
    }
  }

  /*
   * Edit profile api
   */
  static Future<bool> editProfile(String name, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt('id');

    final url = Uri.parse('$urlbase/authorization/user/editProfile/$id');

    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'profile': 'profile'
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
        print('Edit failed with status: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error : $error');
      return false;
    }
  }

  /*
   * Add plant api
   */
  static Future<bool> addPlant(String name, String speicies) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? path = prefs.getString('path');
    int? id = prefs.getInt('id');

    final url = Uri.parse('$urlbase/authorization/user/addPlant/$id');

    final Map<String, dynamic> data = {
      'nickname': name,
      'name': speicies,
      'image': path,
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
        print('Add Plant failed with status: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error : $error');
      return false;
    }
  }

  /*
   * Get plant name api
   */
  static Future<List<String>> getPlantNames() async {
    final url = Uri.parse('$urlbase/authorization/admin/displayPlants');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData.containsKey('data')) {
          final List<dynamic> plantsData = responseData['data'];
          final List<String> plantNames =
              plantsData.map((plant) => plant['plant_name'] as String).toList();
          return plantNames;
        } else {
          throw Exception('Invalid response format: ${response.statusCode}');
        }
      } else {
        throw Exception('Failed to fetch plant data');
      }
    } catch (error) {
      throw Exception('Error fetching plant data: $error');
    }
  }

  /*
   * View plant api
   */
  static Future<List> viewPlants(bool getInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt('id');
    final url = Uri.parse('$urlbase/authorization/user/viewPlants/$id');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (getInfo) {
          final List<dynamic> plantsData = responseData['data2'];
          // final List<String> plantNames =
          //     plantsData.map((plant) => plant['plant_name'] as String).toList();
          return plantsData;
        } else {
          final List<dynamic> plantsData = responseData['data1'];
          // final List<String> plantNames =
          //     plantsData.map((plant) => plant['plant_name'] as String).toList();
          return plantsData;
        }
      } else {
        throw Exception('Invalid response format: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching plant data: $error');
    }
  }

  /*
   * View all plant api
   */
  static Future<List> viewAllPlant() async {
    final url = Uri.parse('$urlbase/authorization/admin/displayPlants');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final List<dynamic> plantsData = responseData['data'];
        // final List<String> plantNames =
        //     plantsData.map((plant) => plant['plant_name'] as String).toList();
        return plantsData;
      } else {
        throw Exception('Invalid response format: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching plant data: $error');
    }
  }

  /*
   * Display plant information api
   */
  static Future<List<Map<String, dynamic>>> displayPlantInfo(
      int? plant_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt('id');
    final url =
        Uri.parse('$urlbase/authorization/admin/displayInformation/$plant_id');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final List<Map<String, dynamic>> plantDetailsList = [];
        final List<dynamic> plantData = responseData['data'];

        for (var plant in plantData) {
          if (plant is Map<String, dynamic>) {
            plantDetailsList.add(plant);
          }
        }
        return plantDetailsList;
      } else {
        throw Exception('Invalid response format: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }

  /*
   * Display rewards api
   */
  static Future<List> displayRewards() async {
    final url = Uri.parse('$urlbase/authorization/user/displayRewards');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final List<dynamic> rewardsData = responseData['data'];

        return rewardsData;
      } else {
        throw Exception('Invalid response format: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching  data: $error');
    }
  }

  /*
   * Redeem rewards api
   */
  static Future<bool> redeemReward(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt('id');

    final url = Uri.parse('$urlbase/authorization/user/redeemReward/$id/$name');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Redeem reward failed with status: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error : $error');
      return false;
    }
  }

  /*
   * Display total points api
   */
  static Future<String> displayTotalPoint() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt('id');
    final url = Uri.parse('$urlbase/authorization/user/viewProfileDetails/$id');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final Map<String, dynamic> profileData = responseData['user_data'];

        String totalPoints = profileData['user_points'].toString();
        return totalPoints;
      } else {
        throw Exception('Invalid response format: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }

  /*
   * Display user name api
   */
  static Future<String> displayUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt('id');
    final url = Uri.parse('$urlbase/authorization/user/viewProfileDetails/$id');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final Map<String, dynamic> profileData = responseData['user_data'];

        String username = profileData['user_name'].toString();
        return username;
      } else {
        throw Exception('Invalid response format: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }

  /*
   * Display user image api
   */
  static Future<List<Map<String, dynamic>>> displayUserImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt('id');
    final url = Uri.parse('$urlbase/authorization/user/viewProfileDetails/$id');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final List<Map<String, dynamic>> images = [];
        final List<dynamic> userData = responseData['images'];

        for (var image in userData) {
          if (image is Map<String, dynamic>) {
            images.add(image);
          }
        }
        return images;
      } else {
        throw Exception('Invalid response format: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }

  /*
   * Checkin api
   */
  static Future<bool> checIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt('id');
    final url = Uri.parse('$urlbase/authorization/user/checkIn/$id');

    final Map<String, dynamic> data = {};

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
        print('checkin failed with status: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error : $error');
      return false;
    }
  }

  /*
   * Donate api
   */
  static Future<bool> donate(int amount, String currency) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt('id');

    final url = Uri.parse('$urlbase/authorization/user/donate/$id');

    final Map<String, dynamic> data = {'amount': amount, 'currency': currency};

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
        print('Donation failed with status: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error : $error');
      return false;
    }
  }

  /*
   * Insert image api
   */
  static Future<bool> insertImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt('id');
    String? p = prefs.getString('path');
    final url = Uri.parse('$urlbase/authorization/user/insert_image/$id');

    final Map<String, dynamic> data = {'image_name': p};

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
        print('failed with status: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error : $error');
      return false;
    }
  }
}
