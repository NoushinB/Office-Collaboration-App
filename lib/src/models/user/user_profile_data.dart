class UserProfileDataModel {
    String avatarUrl;
    String fullName;
    int id;
    String phone;
    String userName;

    UserProfileDataModel({this.avatarUrl, this.fullName, this.id, this.phone, this.userName});

    factory UserProfileDataModel.fromJson(Map<String, dynamic> json) {
        return UserProfileDataModel(
            avatarUrl: json['avatarUrl'], 
            fullName: json['fullName'], 
            id: json['id'], 
            phone: json['phone'], 
            userName: json['userName'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['avatarUrl'] = this.avatarUrl;
        data['fullName'] = this.fullName;
        data['id'] = this.id;
        data['phone'] = this.phone;
        data['userName'] = this.userName;
        return data;
    }
}