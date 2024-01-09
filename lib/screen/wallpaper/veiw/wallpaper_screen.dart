import 'package:flutter/material.dart';

class WallpaperScreen extends StatefulWidget {
  const WallpaperScreen({super.key});

  @override
  State<WallpaperScreen> createState() => _WallpaperScreenState();
}

class _WallpaperScreenState extends State<WallpaperScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Wallpaper",
            style: TextStyle(fontSize: 24,color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
