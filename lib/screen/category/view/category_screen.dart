import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/screen/category/provider/category_provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryProvider? providerr;
  CategoryProvider? providerw;

  @override
  Widget build(BuildContext context) {
    providerr = context.read<CategoryProvider>();
    providerw = context.watch<CategoryProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Category",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: ListView.builder(
          itemCount: providerw!.categoryList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                providerr!.changCategory("${providerr!.categoryList[index]}");
                Navigator.pushNamed(context, 'categoryhome');
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "${providerw!.photoList[index].image}",
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          "${providerw!.categoryList[index]}",
                          style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
