class CategoryListItemModel {
  int id;
  String name;

  CategoryListItemModel({this.id, this.name});

  factory CategoryListItemModel.fromJson(Map<String, dynamic> json) {
    return CategoryListItemModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
