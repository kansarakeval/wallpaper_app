import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/screen/category/view/category_screen.dart';
import 'package:wallpaper_app/screen/dash/provider/dash_provider.dart';
import 'package:wallpaper_app/screen/search/veiw/search_screen.dart';
import 'package:wallpaper_app/screen/wallpaper/veiw/wallpaper_screen.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  DashProvider? providerr;
  DashProvider? providerw;

  List<Widget> dashList = [
    WallpaperScreen(),
    CategoryScreen(),
    SearchScreen(),
    WallpaperScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    providerr = context.read<DashProvider>();
    providerw = context.watch<DashProvider>();
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BottomNavigationBar(
                fixedColor: Colors.white,
                currentIndex: providerw!.dashIndex,
                items: const [
                  BottomNavigationBarItem(
                    backgroundColor: Colors.red,
                      icon: Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                      ),
                      label: "home",),
                  BottomNavigationBarItem(
                      backgroundColor: Colors.red,
                      icon: Icon(
                        Icons.view_comfy_alt,
                        color: Colors.white,
                      ),
                      label: "category"),
                  BottomNavigationBarItem(
                      backgroundColor: Colors.red,
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      label: "search"),
                  BottomNavigationBarItem(
                      backgroundColor: Colors.red,
                      icon: Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                      ),
                      label: "setting"),
                ],
                onTap: (value) {
                  int i = value;
                  providerr!.changeIndex(i);
                },
              ),
            ),
          ),
          body: dashList[providerw!.dashIndex],
        ),
      ),
    );
  }
}
