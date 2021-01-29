import 'package:AppShopping/core/core_service.dart';
import 'package:AppShopping/home/model/home_model.dart';
import 'package:AppShopping/products/danhsach/bloc/danhsach_sanpham_bloc.dart';
import 'package:AppShopping/products/danhsach/bloc/danhsach_sanpham_state.dart';
import 'package:AppShopping/products/danhsach/model/danh_sach_san_phan_model.dart';
import 'package:AppShopping/utils/function.dart';
import 'package:AppShopping/widget/widget_loading.dart';
import 'package:AppShopping/widget/widget_no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietinfo_dev_core/vietinfo_dev_core.dart';

class DanhSachSanPhamPage extends StatefulWidget {
  final String ID;
  final String title;

  const DanhSachSanPhamPage({Key key, this.ID, this.title}) : super(key: key);

  @override
  _DanhSachSanPhamPageState createState() => _DanhSachSanPhamPageState();
}

class _DanhSachSanPhamPageState extends State<DanhSachSanPhamPage> {
  DanhSachSanPhamBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<DanhSachSanPhamBloc>(context);
    bloc.callDanhSachSanPham(sanPhamID: widget.ID);
  }

  @override
  Widget build(BuildContext context) {
    core.init(context);
    Size sizeWidget = core.screenSize;

    BoxDecoration backgroundAppBar = BoxDecoration(
      gradient: new LinearGradient(
          colors: [
            const Color(0xFF1f7ac4),
            const Color(0xFF4ec4f0),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
    );
    return WidgetScreen(
      heightAppBar: 100,
      appBarBoxDecoration: backgroundAppBar,
      appBar: Container(
        decoration: backgroundAppBar,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.keyboard_backspace,
                    color: Colors.white,
                    size: 30,
                  )),
              Expanded(
                child: Center(
                    child: Text(
                  widget.title ?? "Danh Sách",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: core.getFontSize(16)),
                )),
              ),
            ],
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: core.screenSize.width,
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: BlocBuilder<DanhSachSanPhamBloc, DanhSachSanPhamState>(
            builder: (context, state) {
              if (state.products.length == 0) {
                return WidgetLoading();
              }
              if (state.products?.length > 0)
                return Column(
                  children: listWidget(state.products),
                );
              return WidgetNoData();
            },
          ),
        ),
      ),
    );
  }

  List<Widget> listWidget(List<Products> data) {
    List<Widget> listWidget = [];
    for (var item in data) {
      listWidget.add(itemWidget(item));
    }
    return listWidget;
  }

  Widget itemWidget(Products data) {
    return GestureDetector(
      onTap: () {
        bloc.callNextPageChiTiet(
            context: context, id: data.productId.toString());
      },
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image(
                  image: NetworkImage(getLinkImageOnline(data.image)),
                  width: core.screenSize.width / 3,
                  height: core.screenSize.width / 3,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  data.name,
                  style: TextStyle(fontSize: core.getFontSize(16)),
                ),
              )
            ],
          ),
          Container(
            width: core.screenSize.width,
            height: 1,
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }
}
