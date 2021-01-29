import 'package:AppShopping/core/core_service.dart';
import 'package:AppShopping/products/chitiet/bloc/chitiet_sanpham_bloc.dart';
import 'package:AppShopping/products/chitiet/model/chi_tiet_san_pham_model.dart';
import 'package:AppShopping/products/chitiet/widget/widget_product_info_tabs.dart';
import 'package:AppShopping/products/chitiet/widget/widget_related_products.dart';
import 'package:AppShopping/widget/widget_loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vietinfo_dev_core/vietinfo_dev_core.dart';
import 'package:intl/intl.dart';

class ChiTietSanPhamPage extends StatefulWidget {
  final String id;

  const ChiTietSanPhamPage({Key key, this.id}) : super(key: key);

  @override
  _ChiTietSanPhamPageState createState() => _ChiTietSanPhamPageState();
}

class _ChiTietSanPhamPageState extends State<ChiTietSanPhamPage> {
  ChiTietSanPhamBloc bloc;
  CarouselController buttonCarouselController = CarouselController();
  int soLuong = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = ChiTietSanPhamBloc();

    bloc.callChiTietSanPham(id: widget.id);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    core.init(context);
    return WidgetScreen(
      heightAppBar: 100,
      appBarBoxDecoration: BoxDecoration(color: Colors.lightBlueAccent),
      child: Container(
        width: core.screenSize.width,
        color: Colors.white,
        child: Stack(
          children: [
            StreamBuilder<ChiTietSanPhamModel>(
                stream: bloc.streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          CarouselSlider(
                            items: itemCarouselSlider(
                                snapshot.data.data.imagesUrl),
                            carouselController: buttonCarouselController,
                            options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 1.0,
                              aspectRatio: 1.0,
                              height: core.screenSize.width / 2,
                              initialPage: 1,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            color: Colors.blue[50],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: core.screenSize.width,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Text(
                                        "${snapshot.data.data.name}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: core.getFontSize(16)),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${NumberFormat("#,###", "en_US").format(snapshot.data.data.price)} đ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    core.getFontSize(16),
                                                color: Colors.red),
                                            textAlign: TextAlign.left,
                                          ),
                                          Image(
                                            image: AssetImage(
                                                "assets/images/heart.png"),
                                            color: Colors.blue,
                                            width: 30,
                                            height: 30,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: DefaultTextStyle.of(context)
                                              .style,
                                          children: <TextSpan>[
                                            TextSpan(text: "model: "),
                                            TextSpan(
                                                text:
                                                    "${snapshot.data.data.sku ?? ""}",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                ///widget số lượng
                                Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Text("Số lượng: ",
                                            style: TextStyle(
                                                fontSize:
                                                    core.getFontSize(15))),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey[200])),
                                          padding: EdgeInsets.all(10.0),
                                          child: SizedBox(
                                            width: core.screenSize.width / 3,
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (soLuong > 1)
                                                        soLuong -= 1;
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                        .grey[
                                                                    200]))),
                                                    child: Center(
                                                        child: Icon(
                                                            Icons.remove)),
                                                    padding: EdgeInsets.only(
                                                        right: 10.0),
                                                  ),
                                                ),
                                                Text(
                                                  "$soLuong",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: core
                                                          .getFontSize(16)),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      soLuong += 1;
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            left: BorderSide(
                                                                color: Colors
                                                                        .grey[
                                                                    200]))),
                                                    child: Center(
                                                        child:
                                                            Icon(Icons.add)),
                                                    padding: EdgeInsets.only(
                                                        left: 10.0),
                                                  ),
                                                )
                                              ],
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                            ),
                                          ),
                                        )
                                      ],
                                    )),

                                SizedBox(
                                  height: 10,
                                ),

                                ///widget thông tin sản phẩm
                                Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.all(10.0),
                                    child: WidgetProductInfoTabs(
                                      listData:
                                          snapshot.data.data.productInfoTabs,
                                    )),

                                SizedBox(
                                  height: 10,
                                ),

                                ///widget sản phảm liên quan
                                Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.all(10.0),
                                  child: WidgetRelatedProducts(
                                    listData:
                                        snapshot.data.data.relatedProducts??[],
                                  ),
                                  width: core.screenSize.width,
                                ),
                                SizedBox(
                                  height: core.screenSize.height / 14,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return WidgetLoading();
                }),

            ///button back page
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),

            ///button giỏ hàng
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: core.screenSize.height / 14,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          iconOnText(icon: Icon(Icons.chat), text: "Chat ngay"),
                          Container(
                            color: Colors.grey[200],
                            width: 1,
                          ),
                          GestureDetector(
                            onTap: () {
                              bloc.callAddCart(context: context);
                            },
                            child: iconOnText(
                                icon: Icon(Icons.add_shopping_cart),
                                text: "Thêm vào giỏ hàng"),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(10.0),
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          "Mua ngày",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconOnText({Icon icon, String text}) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [icon, Text("$text")],
      ),
    );
  }

  List<Widget> itemCarouselSlider(List<String> data) {
    List<Widget> listWidget = [];
    for (var item in data) {
      listWidget.add(SizedBox(
        width: core.screenSize.width / 3 * 2,
        height: core.screenSize.height,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image(
              image: NetworkImage(CoreUrlImage + item),
              fit: BoxFit.cover,
            )),
      ));
    }
    return listWidget;
  }
}
