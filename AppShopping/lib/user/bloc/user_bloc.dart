import 'package:AppShopping/core/key_prefs.dart';
import 'package:AppShopping/home/page/home_page.dart';
import 'package:AppShopping/user/model/login_param.dart';
import 'package:AppShopping/user/model/register_param.dart';
import 'package:AppShopping/user/page/register_page.dart';
import 'package:AppShopping/user/service/user_service.dart';
import 'package:AppShopping/utils/show_flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:vietinfo_dev_core/core/shared_prefs.dart';

class UserBloc {
  UserService api;
  ProgressDialog progressDialog;

  UserBloc(BuildContext context) {
    api = UserService();
    progressDialog =
        new ProgressDialog(context, showLogs: true, isDismissible: false);
    progressDialog.style(message: "Đang xử lý...");
  }

  void callLogin(
      {BuildContext context, String userName, String password}) async {
    await progressDialog.show();
    var dataResult =
        await api.login(param: LoginParam(email: userName, password: password));
    await progressDialog.hide();
    if (dataResult.data.token != null && dataResult.data.token.isNotEmpty) {
      SharedPrefs.setValue<String>(KeyPrefs.userName, dataResult.data.email);
      SharedPrefs.setValue<String>(KeyPrefs.fullName, dataResult.data.name);
      SharedPrefs.setValue<String>(KeyPrefs.avatar, dataResult.data.avatarUrl);
       Navigator.of(context).pop<String>(dataResult.data.email);
    } else {
      showFlushbar(
          ctx: context,
          message: "Đăng nhập không thành công.",
          loaiThongBao: LoaiThongBao.thatBai,
          tgianHienThi: 2);
    }
  }

  void callRegisterLogin(
      {BuildContext context,
      String email,
      String password,
      String name,
      String phone}) async {
    await progressDialog.show();
    var dataResult = await api.register(
        param: RegisterParam(
            email: email, password: password, name: name, phone: phone));
    await progressDialog.hide();
    if (dataResult.data.token != null && dataResult.data.token.isNotEmpty) {
      SharedPrefs.setValue<String>(KeyPrefs.userName, email);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()),
          (Route<dynamic> route) => false);
    } else {
      showFlushbar(
          ctx: context,
          message: "Đăng nhập không thành công.",
          loaiThongBao: LoaiThongBao.thatBai,
          tgianHienThi: 2);
    }
  }

  void callPageRegister({BuildContext context}) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegisterPage()));
  }
}
