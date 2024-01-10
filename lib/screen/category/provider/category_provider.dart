import 'package:flutter/material.dart';
import 'package:wallpaper_app/screen/category/model/category_model.dart';
import 'package:wallpaper_app/screen/wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper_app/util/api_helper.dart';

class CategoryProvider with ChangeNotifier {
  List<String> categoryList = ["Car", "Animal", "Science", "Flower", "Nature"];
  List<CategoryModel> photoList = [
    CategoryModel(image: "assets/img/car5.jpg"),
    CategoryModel(image: "assets/img/animal4.jpg"),
    CategoryModel(image: "assets/img/science3.jpg"),
    CategoryModel(image: "assets/img/flower2.jpg"),
    CategoryModel(image: "assets/img/Nature1.jpg"),
  ];

  //category
  WallpaperModel? wallpaperModel;

  String selectedcategory="nature";

  void changCategory(String category){
    selectedcategory=category;
    notifyListeners();
  }

  Future<WallpaperModel?> getCategoryData() async {
    APIHelper apiHelper = APIHelper();
    WallpaperModel? wallpaper1 = await apiHelper.categoryApiCall(selectedcategory);
    wallpaperModel = wallpaper1;
    // notifyListeners();
    return wallpaperModel;
  }
}
