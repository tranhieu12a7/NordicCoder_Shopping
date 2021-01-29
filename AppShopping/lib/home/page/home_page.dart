import 'package:AppShopping/core/core_service.dart';
import 'package:AppShopping/home/bloc/home_bloc.dart';
import 'package:AppShopping/home/model/home_model.dart';
import 'package:AppShopping/home/widget/widget_danhmuc_sanpham.dart';
import 'package:AppShopping/home/widget/widget_dichvu_canhbao.dart';
import 'package:AppShopping/widget/widget_loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietinfo_dev_core/vietinfo_dev_core.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage> {
  HomeBloc bloc;
  CarouselController buttonCarouselController = CarouselController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<HomeBloc>(context);
    bloc.callDataHome();
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
      appBarBoxDecoration: backgroundAppBar,
      appBar: Container(
        height: 80,
        padding: EdgeInsets.all(5.0),
        decoration: backgroundAppBar,
        child: Row(
          children: [
            Image(
              image: AssetImage("assets/images/iconlogo.png"),
              width: 50,
              height: 50,
            ),
            Expanded(
              child: Container(
                width: sizeWidget.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[200])),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Color(0xFF8bc4f6),
                        size: 35,
                      ),
                      Expanded(
                        child: TextField(
                          style:
                              TextStyle(fontSize: core.getFontSize(14)),
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Tìm kiếm tên.."),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.phone,
                color: Colors.white,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart_outlined,
                  color: Colors.white, size: 30),
            ),
          ],
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: core.screenSize.width,
        color: Colors.blueGrey[50],
        child: SingleChildScrollView(
          child: StreamBuilder<HomeModel>(
              stream: bloc.streamHome.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) if (snapshot.data.data != null)
                  return Column(
                    children: [
                      CarouselSlider(
                        items: itemCarouselSlider(snapshot.data.data.sliders),
                        carouselController: buttonCarouselController,
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 1.0,
                          aspectRatio: 2.0,
                          initialPage: 1,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      WidgetDichVuCanhBao(
                        dataDichVuCanhBao: snapshot.data.data.services,
                      ),
                      WidgetDanhMucSanPham(
                        dataCategories: snapshot.data.data.categories,
                        buildContext: context,
                      )
                    ],
                  );
                else {
                  return SizedBox();
                }
                return WidgetLoading();
              }),
        ),
      ),
    );
  }

  List<Widget> itemCarouselSlider(List<Sliders> data) {
    List<Widget> listWidget = [];
    for (var item in data) {
      listWidget.add(ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image(
            image: NetworkImage(CoreUrlImage + item.image),
            fit: BoxFit.cover,
          )));
    }
    return listWidget;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
