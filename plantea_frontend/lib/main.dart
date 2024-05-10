import 'package:flutter/material.dart';
import 'package:plantea/pages/splash_screen.dart';
import 'package:plantea/services/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => IdentificationProvider(),
        builder: ((context, child) {
          return const SplashScreen();
        }),
      ),
    );
  }
}
