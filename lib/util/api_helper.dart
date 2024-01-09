import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/screen/wallpaper/model/wallpaper_model.dart';
class APIHelper{
  //wallpaper
  Future<WallpaperModel?> wallpaperApiCall() async {
    String apiLink =
        "https://pixabay.com/api/?key=41719809-bfbc15734e5fd2f31cfcb2f83&q=festival&image_type=all";

    var response = await http.get(Uri.parse(apiLink));
    if (response.statusCode == 200) {
      var json =jsonDecode(response.body);
      WallpaperModel wallpaperModel= WallpaperModel.mapToModel(json);
      return wallpaperModel;
    }
    return null;
  }
}