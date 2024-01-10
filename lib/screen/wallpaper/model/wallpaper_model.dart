class WallpaperModel{
  int? total,totalHits;
  List<HitsModel>? hitsList=[];

  WallpaperModel({this.total, this.totalHits, this.hitsList});
  
  factory WallpaperModel.mapToModel(Map m1){
    List l1=m1['hits'];
    return WallpaperModel(
      total: m1['total'],
      totalHits: m1['totalHits'],
      hitsList: l1.map((e) => HitsModel.mapToModel(e)).toList(),
    );
  }
}
class HitsModel{
  int? id,previewWidth,previewHeight,webformatWidth,webformatHeight,imageWidth,imageHeight,imageSize,views,downloads,collections,likes,comments,user_id;
  String? pageURL,type,tags,previewURL,webformatURL,largeImageURL,user,userImageURL;

  HitsModel(
      {this.id,
      this.previewWidth,
      this.previewHeight,
      this.webformatWidth,
      this.webformatHeight,
      this.imageWidth,
      this.imageHeight,
      this.imageSize,
      this.views,
      this.downloads,
      this.collections,
      this.likes,
      this.comments,
      this.user_id,
      this.pageURL,
      this.type,
      this.tags,
      this.previewURL,
      this.webformatURL,
      this.largeImageURL,
      this.user,
      this.userImageURL});

  factory HitsModel.mapToModel(Map m1){
    return HitsModel(
      id: m1['id'],
      pageURL: m1['pageURL'],
      type: m1['type'],
      tags: m1['tags'],
      previewURL: m1['previewURL'],
      previewWidth: m1['previewWidth'],
      previewHeight: m1['previewHeight'],
      webformatURL: m1['webformatURL'],
      webformatWidth: m1['webformatWidth'],
      webformatHeight: m1['webformatHeight'],
      largeImageURL: m1['largeImageURL'],
      imageWidth: m1['imageWidth'],
      imageHeight: m1['imageHeight'],
      imageSize: m1['imageSize'],
      views: m1['views'],
      downloads: m1['downloads'],
      collections: m1['collections'],
      likes: m1['likes'],
      comments: m1['comments'],
      user_id: m1['user_id'],
      user: m1['user'],
      userImageURL: m1['userImageURL'],
    );
  }
}