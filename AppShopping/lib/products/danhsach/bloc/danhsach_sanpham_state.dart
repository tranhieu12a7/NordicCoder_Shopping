import 'package:AppShopping/products/danhsach/model/danh_sach_san_phan_model.dart';

class DanhSachSanPhamState{
  List<Products> products;

  DanhSachSanPhamState({this.products});

  DanhSachSanPhamState clone({products}){
    return DanhSachSanPhamState(products: products??this.products);
  }
}