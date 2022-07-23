class WallpaperModel {
  int id;
  String name;
  String imageUrl;
  String category;

  WallpaperModel({this.id, this.name, this.imageUrl, this.category});

  WallpaperModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['name'];
    imageUrl = json['image_url'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['category'] = this.category;
    return data;
  }
}
