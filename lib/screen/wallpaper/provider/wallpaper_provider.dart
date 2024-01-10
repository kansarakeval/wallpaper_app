import 'package:flutter/material.dart';
import 'package:wallpaper_app/screen/wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper_app/util/api_helper.dart';


class WallpaperProvider with ChangeNotifier {
  WallpaperModel? wallpaperModel;

  Future<WallpaperModel?> getWallpaperData() async {
    APIHelper apiHelper = APIHelper();
    WallpaperModel? wallpaper1 = await apiHelper.wallpaperApiCall();
    wallpaperModel = wallpaper1;
    // notifyListeners();
    return wallpaperModel;
  }


}
