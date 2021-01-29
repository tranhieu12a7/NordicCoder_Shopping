import 'package:AppShopping/home/model/home_model.dart';
import 'package:AppShopping/products/danhsach/bloc/danhsach_sanpham_bloc.dart';
import 'package:AppShopping/products/danhsach/page/danhsach_sanpham_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DanhSachSanPhamMain extends StatelessWidget {
  final String ID;
  final String title;

  const DanhSachSanPhamMain({Key key, this.ID, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DanhSachSanPhamBloc(),
      child: DanhSachSanPhamPage(
        title: title,
        ID: ID,
      ),
    );
  }
}
