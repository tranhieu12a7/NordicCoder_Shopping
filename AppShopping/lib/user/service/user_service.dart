import 'package:AppShopping/core/core_service.dart';
import 'package:AppShopping/products/chitiet/model/chi_tiet_san_pham_model.dart';
import 'package:AppShopping/user/model/login_param.dart';
import 'package:AppShopping/user/model/register_param.dart';
import 'package:AppShopping/user/model/user_model.dart';
import 'package:vietinfo_dev_core/vietinfo_dev_core.dart';


class UserService{
  NetworkDataSource network;
  UserService(){
    network=new NetworkResponse();
  }

  Future<UserModel> login({LoginParam param}) async {
    try {
      final url = CoreUrl + 'user/sign-in';
      NetWorkResult data = await network.post(Uri.parse(url),body: param.toJson());
      if (data.status == ENetWorkStatus.Error) {
        return null;
      }
      return UserModel.fromJson(data.dataResult);
    } catch (Exception) {
      print("UserService - login : $Exception");
      return null;
    }
  }
  Future<UserModel> register({RegisterParam param}) async {
    try {
      final url = CoreUrl + 'user/sign-up';
      NetWorkResult data = await network.post(Uri.parse(url),body: param.toJson());
      if (data.status == ENetWorkStatus.Error) {
        return null;
      }
      return UserModel.fromJson(data.dataResult);
    } catch (Exception) {
      print("UserService - login : $Exception");
      return null;
    }
  }


}
