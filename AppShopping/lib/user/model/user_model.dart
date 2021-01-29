/// code : 200
/// message : "Xử lý thành công"
/// data : {"customer_id":27,"name":"Nguyen Huu Phuc","email":"test5@gmail.com","avatar_url":"https://www.pikpng.com/pngl/m/80-805523_default-avatar-svg-png-icon-free-download-264157.png","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOjI3LCJSb2xlIjoxLCJleHAiOjE3Njk0OTkxMzZ9.xeQCzp9Q5bRLwxpdM_c_akWEWtzVeCgv8LSpPTOyr9A","role_id":1,"group_id":1,"shipping_region_id":"1","phone":"0999999999"}

class UserModel {
  int code;
  String message;
  Data data;

  UserModel({
      this.code, 
      this.message, 
      this.data});

  UserModel.fromJson(dynamic json) {
    code = json["code"];
    message = json["message"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    map["message"] = message;
    if (data != null) {
      map["data"] = data.toJson();
    }
    return map;
  }

}

/// customer_id : 27
/// name : "Nguyen Huu Phuc"
/// email : "test5@gmail.com"
/// avatar_url : "https://www.pikpng.com/pngl/m/80-805523_default-avatar-svg-png-icon-free-download-264157.png"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOjI3LCJSb2xlIjoxLCJleHAiOjE3Njk0OTkxMzZ9.xeQCzp9Q5bRLwxpdM_c_akWEWtzVeCgv8LSpPTOyr9A"
/// role_id : 1
/// group_id : 1
/// shipping_region_id : "1"
/// phone : "0999999999"

class Data {
  int customerId;
  String name;
  String email;
  String avatarUrl;
  String token;
  int roleId;
  int groupId;
  String shippingRegionId;
  String phone;

  Data({
      this.customerId, 
      this.name, 
      this.email, 
      this.avatarUrl, 
      this.token, 
      this.roleId, 
      this.groupId, 
      this.shippingRegionId, 
      this.phone});

  Data.fromJson(dynamic json) {
    customerId = json["customer_id"];
    name = json["name"];
    email = json["email"];
    avatarUrl = json["avatar_url"];
    token = json["token"];
    roleId = json["role_id"];
    groupId = json["group_id"];
    shippingRegionId = json["shipping_region_id"];
    phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["customer_id"] = customerId;
    map["name"] = name;
    map["email"] = email;
    map["avatar_url"] = avatarUrl;
    map["token"] = token;
    map["role_id"] = roleId;
    map["group_id"] = groupId;
    map["shipping_region_id"] = shippingRegionId;
    map["phone"] = phone;
    return map;
  }

}