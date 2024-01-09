import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
          () {
        Navigator.pushReplacementNamed(context, 'dash');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/logo.png',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
