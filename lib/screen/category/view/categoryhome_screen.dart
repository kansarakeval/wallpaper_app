import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/screen/category/provider/category_provider.dart';

class CateforyScren extends StatefulWidget {
  const CateforyScren({super.key});

  @override
  State<CateforyScren> createState() => _CateforyScrenState();
}

class _CateforyScrenState extends State<CateforyScren> {
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
            "Wallpaper",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
          future: providerr!.getCategoryData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,mainAxisExtent: 200),
                itemCount: providerw!.wallpaperModel!.hitsList!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "${providerw!.wallpaperModel!.hitsList![index].largeImageURL}",
                        height: 200,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
