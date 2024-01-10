import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/screen/search/provider/search_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchProvider? providerr;
  SearchProvider? providerw;

  @override
  void initState() {
    super.initState();
    context.read<SearchProvider>().getSearchData();
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<SearchProvider>();
    providerw = context.watch<SearchProvider>();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: SearchBar(
                hintText: "search bar",
                elevation: const MaterialStatePropertyAll(0.5),
                trailing: const [
                  Icon(Icons.search),
                ],
                onSubmitted: (value) {
                  providerr!.SearchData(value);
                  providerr!.getSearchData();
                },
              ),
            ),
            providerw!.wallpaperModel == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisExtent: 200),
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
                  ),
          ],
        ),
      ),
    );
  }
}
