
import 'package:AppShopping/products/chitiet/model/chi_tiet_san_pham_model.dart';
import 'package:flutter/material.dart';
import 'package:vietinfo_dev_core/vietinfo_dev_core.dart';

class WidgetProductInfoTabs extends StatefulWidget {
  final List<Product_info_tabs> listData;
  const WidgetProductInfoTabs({Key key, this.listData}) : super(key: key);

  @override
  _WidgetProductInfoTabsState createState() => _WidgetProductInfoTabsState();
}

class _WidgetProductInfoTabsState extends State<WidgetProductInfoTabs> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: listWidget(widget.listData??[]),
    );
  }

  List<Widget> listWidget(List<Product_info_tabs> data){
    List<Widget> listWidget=[];
    for(var item in data){
      listWidget.add(itemWidget(item));
    }
    return listWidget;
  }

  Widget itemWidget(Product_info_tabs data){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: GestureDetector(
            onTap: (){
              setState(() {
                data.isShowDetail=!data.isShowDetail;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${data.title}",style: TextStyle(
                  fontSize: core.getFontSize(15)
                ),),
                Icon(!data.isShowDetail?Icons.arrow_drop_down:Icons.arrow_drop_up,size: 30,)
              ],
            ),
          ),
        ),
        data.isShowDetail?Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: itemInListWidget(data.attributesProduct??[]),
          ),
        ):SizedBox()

      ],
    );
  }

  List<Widget> itemInListWidget(List<Attributes_product> data){
    List<Widget> listWidget=[];
    listWidget.add(SizedBox(width: core.screenSize.width,));
    for(var item in data){
      listWidget.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(text: " - "),
              TextSpan(text: "${item.name}: "),
              TextSpan(text: "${item.value}"),
            ]
        )),
      ));

    }
    return listWidget;
  }
}

