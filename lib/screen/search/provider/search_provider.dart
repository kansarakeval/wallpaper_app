import 'package:flutter/material.dart';
import 'package:wallpaper_app/screen/wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper_app/util/api_helper.dart';

class SearchProvider with ChangeNotifier{
  WallpaperModel? wallpaperModel;

  String wallpaperSearch = 'nature';

  void SearchData(String search){
    wallpaperSearch=search;
    notifyListeners();
  }

  Future<void> getSearchData() async {
    APIHelper apiHelper= APIHelper();
    WallpaperModel? wall1 = await apiHelper.categoryApiCall(wallpaperSearch);
    wallpaperModel = wall1;
    notifyListeners();
  }
}