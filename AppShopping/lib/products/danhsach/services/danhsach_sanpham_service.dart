import 'package:AppShopping/core/core_service.dart';
import 'package:AppShopping/products/danhsach/model/danh_sach_san_phan_model.dart';
import 'package:vietinfo_dev_core/vietinfo_dev_core.dart';

class DanhSachSanPhamService{
  NetworkDataSource network;
  DanhSachSanPhamService(){
    network=new NetworkResponse();
  }

  Future<DanhSachSanPhanModel> getListSanPham({String sanPhamID}) async {
    try {
      final url = CoreUrl + 'product/category/$sanPhamID';
      NetWorkResult data = await network.get(url);
      if (data.status == ENetWorkStatus.Error) {
        return null;
      }
      return DanhSachSanPhanModel.fromJson(data.dataResult);
    } catch (Exception) {
      print(Exception);
      return null;
    }
  }
}