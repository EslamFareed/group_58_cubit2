class CategoryModel {
  int? id;
  String? name;
  String? image;

  CategoryModel({this.id, this.image, this.name});

  CategoryModel.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
  }
}
