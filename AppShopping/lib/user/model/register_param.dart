/// email : "test9@gmail.com"
/// password : "123456"
/// phone : "0989878987"
/// name : "Nguyen Van A"

class RegisterParam {
  String email;
  String password;
  String phone;
  String name;

  RegisterParam({
      this.email, 
      this.password, 
      this.phone, 
      this.name});

  RegisterParam.fromJson(dynamic json) {
    email = json["email"];
    password = json["password"];
    phone = json["phone"];
    name = json["name"];
  }

  Map<String, String> toJson() {
    var map = <String, String>{};
    map["email"] = email??"";
    map["password"] = password??"";
    map["phone"] = phone??"";
    map["name"] = name??"";
    return map;
  }

}