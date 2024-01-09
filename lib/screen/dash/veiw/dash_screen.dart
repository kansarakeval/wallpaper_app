import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/screen/dash/provider/dash_provider.dart';
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
    WallpaperScreen(),
    WallpaperScreen(),
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
                fixedColor: Colors.black,
                currentIndex: providerw!.dashIndex,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_outlined,
                        color: Colors.black,
                      ),
                      label: "home",),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.view_comfy_alt,
                        color: Colors.black,
                      ),
                      label: "category"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      label: "search"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings_outlined,
                        color: Colors.black,
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
