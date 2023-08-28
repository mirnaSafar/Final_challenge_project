class LoginModel {
  Data? data;
  bool? status;
  Null error;
  int? statusCode;

  LoginModel({this.data, this.status, this.error, this.statusCode});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    error = json['error'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['error'] = this.error;
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class Data {
  User? user;
  String? token;
  String? message;

  Data({this.user, this.token, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    data['message'] = this.message;
    return data;
  }
}

class User {
  String? uuid;
  String? name;
  String? phone;
  String? collageUuid;
  String? collage;
  String? createdAt;
  String? updatedAt;

  User(
      {this.uuid,
      this.name,
      this.phone,
      this.collageUuid,
      this.collage,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    phone = json['phone'];
    collageUuid = json['collage_uuid'];
    collage = json['collage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['collage_uuid'] = this.collageUuid;
    data['collage'] = this.collage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
