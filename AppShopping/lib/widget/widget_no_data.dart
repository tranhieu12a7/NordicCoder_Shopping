


import 'package:flutter/material.dart';
import 'package:vietinfo_dev_core/vietinfo_dev_core.dart';

class WidgetNoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:core.screenSize.width,
      height:core.screenSize.height,
      child: Center(
        child: Text("Không có dự liệu",style: TextStyle(
          color: Colors.blue
        ),),
      ),
    );
  }
}
