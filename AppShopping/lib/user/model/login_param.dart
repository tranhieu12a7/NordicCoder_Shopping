/// email : "test5@gmail.com"
/// password : "123456"

class LoginParam {
  String email;
  String password;

  LoginParam({
      this.email, 
      this.password});

  LoginParam.fromJson(dynamic json) {
    email = json["email"];
    password = json["password"];
  }

  Map<String, String> toJson() {
    var map = <String, String>{};
    map["email"] = email??"";
    map["password"] = password??"";
    return map;
  }

}