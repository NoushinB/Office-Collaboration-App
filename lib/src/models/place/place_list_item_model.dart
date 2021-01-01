class PlaceListItemModel {
  int id;
  String name;

  PlaceListItemModel({this.id, this.name});

  factory PlaceListItemModel.fromJson(Map<String, dynamic> json) {
    return PlaceListItemModel(
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
