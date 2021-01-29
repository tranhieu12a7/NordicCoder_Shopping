import 'dart:async';

import 'package:AppShopping/home/model/home_model.dart';
import 'package:AppShopping/home/service/home_service.dart';
import 'package:AppShopping/products/danhsach/danhsach_sanpham_main.dart';
import 'package:AppShopping/products/danhsach/page/danhsach_sanpham_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<Object> {
  HomeService dataApi;
  StreamController<HomeModel> streamHome ;
  HomeBloc() : super(Object()) {
    dataApi = new HomeService();
    streamHome = new StreamController<HomeModel>.broadcast();
  }

  void dispose() {
    streamHome.close();
  }

  void callDataHome() async {
    var data = await dataApi.callDataHome();
    streamHome.sink.add(data);
  }

  void callNavigatorDanhSachSanPham({BuildContext context,Categories data,String title}) {

    print(data.categoryId.toString());
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DanhSachSanPhamMain(ID: data.categoryId.toString(),title:  title,)));
  }
}
