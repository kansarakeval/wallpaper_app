import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/screen/category/provider/category_provider.dart';
import 'package:wallpaper_app/screen/dash/provider/dash_provider.dart';
import 'package:wallpaper_app/screen/wallpaper/provider/wallpaper_provider.dart';
import 'package:wallpaper_app/util/app_routes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => DashProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => WallpaperProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CategoryProvider(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: app_Routes,
    ),
  ));
}
