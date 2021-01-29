import 'package:AppShopping/core/core_service.dart';
import 'package:AppShopping/products/chitiet/model/chi_tiet_san_pham_model.dart';
import 'package:vietinfo_dev_core/vietinfo_dev_core.dart';

class ChiTietSanPhamService{
  NetworkDataSource network;
  ChiTietSanPhamService(){
    network=new NetworkResponse();
  }

  Future<ChiTietSanPhamModel> getChiTietSanPham({String id}) async {
    try {
      final url = CoreUrl + 'product/detail/$id';
      NetWorkResult data = await network.get(url);
      if (data.status == ENetWorkStatus.Error) {
        return null;
      }
      return ChiTietSanPhamModel.fromJson(data.dataResult);
    } catch (Exception) {
      print("ChiTietSanPhamService - getChiTietSanPham : $Exception");
      return null;
    }
  }
}