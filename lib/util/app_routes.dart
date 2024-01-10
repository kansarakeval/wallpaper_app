import 'package:flutter/material.dart';
import 'package:wallpaper_app/screen/category/view/categoryhome_screen.dart';
import 'package:wallpaper_app/screen/dash/veiw/dash_screen.dart';
import 'package:wallpaper_app/screen/splash/veiw/splash_screen.dart';
import 'package:wallpaper_app/screen/wallpaper/veiw/wallpaper_screen.dart';

Map<String,WidgetBuilder> app_Routes={
  '/':(context) => const SplashScreen(),
  'dash':(context) => const DashScreen(),
  'categoryhome':(context) => const CateforyScren(),

};