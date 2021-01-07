class PropertiesListResult {
  List<Property> properties;
  int totalCount;
  int totalPages;

  PropertiesListResult({this.properties, this.totalCount, this.totalPages});

  factory PropertiesListResult.fromJson(Map<String, dynamic> json) {
    return PropertiesListResult(
      properties: json['properties'] != null ? (json['properties'] as List).map((i) => Property.fromJson(i)).toList() : null,
      totalCount: json['totalCount'],
      totalPages: json['totalPages'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['totalPages'] = this.totalPages;
    if (this.properties != null) {
      data['properties'] = this.properties.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Property {
  String categoryName;
  String createDate;
  int id;
  String photoUrl;
  String placeName;
  double price;
  String realEstateName;
  String title;

  Property({this.categoryName, this.createDate, this.id, this.photoUrl, this.placeName, this.price, this.realEstateName, this.title});

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      categoryName: json['categoryName'],
      createDate: json['createDate'],
      id: json['id'],
      photoUrl: json['photoUrl'],
      placeName: json['placeName'],
      price: json['price'],
      realEstateName: json['realEstateName'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryName'] = this.categoryName;
    data['createDate'] = this.createDate;
    data['id'] = this.id;
    data['photoUrl'] = this.photoUrl;
    data['placeName'] = this.placeName;
    data['price'] = this.price;
    data['realEstateName'] = this.realEstateName;
    data['title'] = this.title;
    return data;
  }
}
