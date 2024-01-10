import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/screen/wallpaper/model/wallpaper_model.dart';

import 'constant.dart';
class APIHelper{

  // Future<WallpaperModel?> wallpaperApiCall() async {
  //   String apiLink =
  //       "?key=&q=festival&image_type=all";
  //
  //   var response = await http.get(Uri.parse(apiLink));
  //   if (response.statusCode == 200) {
  //     var json =jsonDecode(response.body);
  //     WallpaperModel wallpaperModel= WallpaperModel.mapToModel(json);
  //     return wallpaperModel;
  //   }
  //   return null;
  // }

  //wallpaper
  Future<WallpaperModel?> wallpaperApiCall() async {
    var response = await http.get(Uri.parse("$base_url?key=$apiKey&q=nature&image_type=all"));
    if (response.statusCode == Status_Code) {
      var json =jsonDecode(response.body);
      WallpaperModel wallpaperModel= WallpaperModel.mapToModel(json);
      return wallpaperModel;
    }
    return null;
  }

  //category
  Future<WallpaperModel?> categoryApiCall(String category) async {
    var response = await http.get(Uri.parse("$base_url?key=$apiKey&q=$category&image_type=all"));
    if (response.statusCode == Status_Code) {
      var json =jsonDecode(response.body);
      WallpaperModel wallpaperModel= WallpaperModel.mapToModel(json);
      return wallpaperModel;
    }
    return null;
  }

}