import 'package:AppShopping/core/core_service.dart';
import 'package:AppShopping/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:vietinfo_dev_core/vietinfo_dev_core.dart';

class WidgetDichVuCanhBao extends StatelessWidget {
  final List<Services> dataDichVuCanhBao;

  const WidgetDichVuCanhBao({Key key, this.dataDichVuCanhBao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        dichVuCanhBaoWidget(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: getListWidget(),
          ),
        )
      ],
    );
  }

  List<Widget> getListWidget() {
    List<Widget> listWidget = [];
    for (var item in dataDichVuCanhBao ?? []) {
      listWidget.add(itemDichVuCanhBaoWidget(item));
    }
    return listWidget;
  }

  Widget dichVuCanhBaoWidget() {
    return Row(
      children: [
        Icon(
          Icons.policy_rounded,
          color: Colors.green,
          size: core.getFontSize(30),
        ),
        Text(
          "Dịch vụ cảnh báo",
          style: TextStyle(
              fontSize: core.getFontSize(16), fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget itemDichVuCanhBaoWidget(Services data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image(
              image: NetworkImage(CoreUrlImage + data.image),
              width: core.screenSize.width / 2,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(data.title,style: TextStyle(
            fontSize: core.getFontSize(16)
          ),)
        ],
      ),
    );
  }
}
