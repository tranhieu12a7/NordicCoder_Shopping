import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum LoaiThongBao { thanhCong, thatBai, canhBao }

void showFlushbar(
    {@required BuildContext ctx,
      @required LoaiThongBao loaiThongBao,
      @required String message,
      Icon icon,
      int tgianHienThi}) {
  Color color;
  switch (loaiThongBao) {
    case LoaiThongBao.thanhCong:
      color = Colors.green;
      break;
    case LoaiThongBao.thatBai:
      color = Colors.red;
      break;
    case LoaiThongBao.canhBao:
      color = Colors.amber;
      break;
  }

  Flushbar(
    messageText: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    icon: icon == null ? Container() : icon,
    backgroundColor: color,
    flushbarPosition: FlushbarPosition.TOP,
    duration: Duration(seconds: tgianHienThi == null ? 3 : tgianHienThi),
  )..show(ctx);
}
