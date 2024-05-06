import 'package:flutter/material.dart';
import 'package:plantea/pages/add_plant_page.dart';
import 'package:plantea/pages/donate_page.dart';
import 'package:plantea/pages/edit_profile_page.dart';
import 'package:plantea/pages/login_page.dart';

import 'package:plantea/pages/plant_Info.dart';
import 'package:plantea/pages/plant_care_home_page.dart';
import 'package:plantea/pages/plant_library_page.dart.dart';
import 'package:plantea/pages/profile_page.dart';
import 'package:plantea/pages/redeem_gifts_page.dart';
//import 'package:plantea/pages/redeem_gifts_page.dart';
import 'package:plantea/pages/reminders_page.dart';
//import 'package:plantea/pages/reset_pass_page.dart';
import 'package:plantea/pages/settings_page.dart';
//import 'package:plantea/pages/signup_page.dart';
import 'package:plantea/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RedeemWidget(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text('Next'),
        ),
      ),
    );
  }
}
