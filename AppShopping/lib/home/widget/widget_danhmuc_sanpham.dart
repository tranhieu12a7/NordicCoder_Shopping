import 'package:AppShopping/core/core_service.dart';
import 'package:AppShopping/home/bloc/home_bloc.dart';
import 'package:AppShopping/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietinfo_dev_core/vietinfo_dev_core.dart';

class WidgetDanhMucSanPham extends StatelessWidget {
  final List<Categories> dataCategories;
  final BuildContext buildContext;

  const WidgetDanhMucSanPham({Key key, this.dataCategories, this.buildContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: core.screenSize.width,
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Danh mục sản phẩm",
              style: TextStyle(
                  fontSize: core.getFontSize(16), fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  "Xem tất cả",
                  style: TextStyle(
                      fontSize: core.getFontSize(12),
                      fontStyle: FontStyle.italic,
                      color: Colors.blue),
                ),
                Icon(Icons.arrow_right, color: Colors.blue)
              ],
            )
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: core.screenSize.width,
          color: Colors.white,
          child: Center(
            child: Wrap(
              children: getListWidget(),
              alignment: WrapAlignment.spaceAround,
            ),
          ),
        )
      ],
    );
  }

  List<Widget> getListWidget() {
    List<Widget> listWidget = [];
    for (var item in dataCategories ?? []) {
      listWidget.add(itemWidget(item));
    }
    return listWidget;
  }

  Widget itemWidget(Categories data) {
    double widtImage = core.screenSize.width / 2 - 30;

    return GestureDetector(
      onTap: () {
        BlocProvider.of<HomeBloc>(buildContext)
            .callNavigatorDanhSachSanPham(context: buildContext,data: data,title: data.name);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image(
                image: NetworkImage(CoreUrlImage + data.image),
                width: widtImage/2,
                height: widtImage/2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              data.name,
              style: TextStyle(fontSize: core.getFontSize(16)),
            )
          ],
        ),
      ),
    );
  }
}
