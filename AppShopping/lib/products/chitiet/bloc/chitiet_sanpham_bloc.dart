import 'dart:async';

import 'package:AppShopping/core/key_prefs.dart';
import 'package:AppShopping/products/chitiet/model/chi_tiet_san_pham_model.dart';
import 'package:AppShopping/products/chitiet/page/chitiet_sanpham_page.dart';
import 'package:AppShopping/products/chitiet/service/chitiet_sanpham_service.dart';
import 'package:AppShopping/user/page/login_page.dart';
import 'package:AppShopping/utils/show_flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vietinfo_dev_core/core/shared_prefs.dart';

class ChiTietSanPhamBloc {
  ChiTietSanPhamService _service;

  ChiTietSanPhamBloc() {
    _service = ChiTietSanPhamService();
  }

  StreamController<ChiTietSanPhamModel> streamController =
      new StreamController<ChiTietSanPhamModel>.broadcast();

  void dispose() {
    streamController.close();
  }

  void callAddCart({BuildContext context}) {
    var userName = SharedPrefs.getValue<String>(KeyPrefs.userName);
    if (userName != null) {
      showFlushbar(
          ctx: context,
          message: "Thêm vào giỏ hàng thành công.",
          loaiThongBao: LoaiThongBao.thanhCong,
          tgianHienThi: 2);
      print(userName);
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  void callChiTietSanPham({String id}) async {
    try {
      var dataResult = await _service.getChiTietSanPham(id: id);
      streamController.sink.add(dataResult);
    } catch (error) {
      print("ChiTietSanPhamBloc - callChiTietSanPham: $error");
      streamController.sink.addError(error);
    }
  }

  void callNextPageChiTiet({BuildContext context, String id}) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChiTietSanPhamPage(
          id: id,
        )));
  }
}
