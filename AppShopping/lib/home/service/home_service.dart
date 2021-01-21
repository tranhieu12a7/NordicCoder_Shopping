import 'package:AppShopping/core/core_service.dart';
import 'package:AppShopping/home/model/home_model.dart';
import 'package:vietinfo_dev_core/vietinfo_dev_core.dart';

class HomeService{
  NetworkDataSource network;
  HomeService(){
     network=new NetworkResponse();
  }

  Future<HomeModel> callDataHome() async {
    try {
      final url = CoreUrl + 'home';
      NetWorkResult data = await network.get(url);
      if (data.status == ENetWorkStatus.Error) {
        return null;
      }
      return HomeModel.fromJson(data.dataResult);
    } catch (Exception) {
      print(Exception);
      return null;
    }
  }
}