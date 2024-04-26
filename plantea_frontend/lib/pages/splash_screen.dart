import 'package:flutter/material.dart';

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
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 153, 247, 171),
          ),
          child: const Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Plantea',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 0, 50, 31),
                  fontSize: 96,
                ),
              )
            ],
          ),
        ),
    );
  }
}