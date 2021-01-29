import 'package:AppShopping/products/chitiet/page/chitiet_sanpham_page.dart';
import 'package:AppShopping/products/danhsach/services/danhsach_sanpham_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'danhsach_sanpham_state.dart';

class DanhSachSanPhamBloc extends Cubit<DanhSachSanPhamState> {
  DanhSachSanPhamService service;

  DanhSachSanPhamBloc() : super(DanhSachSanPhamState(products: [])) {
    service = DanhSachSanPhamService();
  }

  void callDanhSachSanPham({String sanPhamID}) async {
    try {
      var data = await service.getListSanPham(sanPhamID: sanPhamID);
      emit(state.clone(products: data.data.products));
    } catch (error) {
      print("DanhSachSanPhamBloc -  callDanhSachSanPham $error");
      emit(state.clone());
    }
  }

  void callNextPageChiTiet({BuildContext context, String id}) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChiTietSanPhamPage(
              id: id,
            )));
  }
}
