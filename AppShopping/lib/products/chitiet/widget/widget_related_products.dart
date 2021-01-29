import 'package:AppShopping/products/chitiet/bloc/chitiet_sanpham_bloc.dart';
import 'package:AppShopping/products/chitiet/model/chi_tiet_san_pham_model.dart';
import 'package:AppShopping/utils/function.dart';
import 'package:flutter/material.dart';
import 'package:vietinfo_dev_core/vietinfo_dev_core.dart';
import 'package:intl/intl.dart';

class WidgetRelatedProducts extends StatelessWidget {
  final List<Related_products> listData;
  final ChiTietSanPhamBloc bloc;

  const WidgetRelatedProducts({Key key, this.listData,this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sản phẩm liên quan",
          style: TextStyle(
              fontSize: core.getFontSize(16), fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: listWidget(context: context,data: listData),
          ),
        )
      ],
    );
  }

  List<Widget> listWidget({BuildContext context,List<Related_products> data}) {
    List<Widget> listWidget = [];
    for (var item in data) {
      listWidget.add(itemWidget(context: context,data: item));
    }
    return listWidget;
  }

  Widget itemWidget({BuildContext context,Related_products data}) {
    return GestureDetector(
      onTap: () {
        bloc.callNextPageChiTiet(
            context: context, id: data.productId.toString());
      },
      child: Expanded(
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          width: core.screenSize.width/2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(2, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image(
                  image: NetworkImage(getLinkImageOnline(data.image)),
                  height: core.screenSize.width / 3,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "${data.name}",
                style: TextStyle(fontSize: core.getFontSize(16)),
              ),
              Text(
                "${NumberFormat("#,###", "en_US").format(data.price)} đ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:
                    core.getFontSize(16),
                    color: Colors.red),
                textAlign: TextAlign.left,
              ),

            ],
          ),
        ),
      ),
    );
  }

}
