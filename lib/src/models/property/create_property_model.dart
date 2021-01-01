class CreatePropertyModel {
    double area;
    int categoryId;
    String description;
    String phone;
    int placeId;
    double price;
    String realEstateName;
    String realEstatePhone;
    String specifications;
    String title;
    String x_Long;
    String y_Lat;

    CreatePropertyModel({this.area, this.categoryId, this.description, this.phone, this.placeId, this.price, this.realEstateName, this.realEstatePhone, this.specifications, this.title, this.x_Long, this.y_Lat});

    factory CreatePropertyModel.fromJson(Map<String, dynamic> json) {
        return CreatePropertyModel(
            area: json['area'], 
            categoryId: json['categoryId'], 
            description: json['description'], 
            phone: json['phone'], 
            placeId: json['placeId'], 
            price: json['price'], 
            realEstateName: json['realEstateName'], 
            realEstatePhone: json['realEstatePhone'], 
            specifications: json['specifications'], 
            title: json['title'], 
            x_Long: json['x_Long'], 
            y_Lat: json['y_Lat'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['area'] = this.area;
        data['categoryId'] = this.categoryId;
        data['description'] = this.description;
        data['phone'] = this.phone;
        data['placeId'] = this.placeId;
        data['price'] = this.price;
        data['realEstateName'] = this.realEstateName;
        data['realEstatePhone'] = this.realEstatePhone;
        data['specifications'] = this.specifications;
        data['title'] = this.title;
        data['x_Long'] = this.x_Long;
        data['y_Lat'] = this.y_Lat;
        return data;
    }
}