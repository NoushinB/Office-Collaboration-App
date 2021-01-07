class PropertyFilterModel {
  Object categoryId;
  Object placeId;

  PropertyFilterModel({this.categoryId, this.placeId});

  factory PropertyFilterModel.fromJson(Map<String, dynamic> json) {
    return PropertyFilterModel(
      categoryId: json['categoryId'] != null ? json['categoryId'] : null,
      placeId: json['placeId'] != null ? json['placeId'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoryId != null) {
      data['categoryId'] = this.categoryId;
    }
    if (this.placeId != null) {
      data['placeId'] = this.placeId;
    }
    return data;
  }
}
