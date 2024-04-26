// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 153, 247, 171),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Plantea',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 0, 50, 31),
                  fontSize: 96,
                ),
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/logo.jpg',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}