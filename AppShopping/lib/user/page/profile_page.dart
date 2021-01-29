import 'package:AppShopping/core/key_prefs.dart';
import 'package:AppShopping/user/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:vietinfo_dev_core/vietinfo_dev_core.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String avatar = "",
      fullName = "",
      email = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    core.init(context);
    avatar = SharedPrefs.getValue<String>(KeyPrefs.avatar) ?? "";
    fullName = SharedPrefs.getValue<String>(KeyPrefs.fullName) ?? "";
    email = SharedPrefs.getValue<String>(KeyPrefs.userName) ?? "";

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
              Expanded(
                child: Center(
                    child: Text(
                      "Tài khoản",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: avatar.isNotEmpty
                      ? Image(
                    image: NetworkImage(
                      avatar,
                    ),
                    width: core.screenSize.width / 6,
                    height: core.screenSize.width / 6,
                  )
                      : Container(
                      padding: EdgeInsets.all(10.0),
                      width: core.screenSize.width / 6,
                      height: core.screenSize.width / 6,
                      color: Colors.grey[400],
                      child: Icon(
                        Icons.person,
                        size: 50,
                      )),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$fullName",
                      style: TextStyle(
                        fontSize: core.getFontSize(16),
                      ),
                    ),
                    Text("$email"),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                color: Colors.grey[400],
                height: 1,
                width: core.screenSize.width,
              ),
            ),
            widgetItemChucNang(
                icon: Icon(Icons.card_travel), title: "Đơn hàng"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                color: Colors.grey[400],
                height: 1,
                width: core.screenSize.width,
              ),
            ),

            email.isEmpty
                ? GestureDetector(
              onTap: () async {
                var dataResult = await Navigator.of(context).push<String>(
                    MaterialPageRoute(builder: (context) => LoginPage()));
                if (dataResult != null && dataResult.isNotEmpty) {
                  setState(() {
                    email = dataResult;
                  });
                }
              },
              child: Container(
                width: core.screenSize.width,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                decoration: backgroundAppBar,
                child: Center(
                    child: Text(
                      "ĐĂNG NHẬP",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget widgetItemChucNang({Icon icon, String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [Padding(
            padding: const EdgeInsets.all(10.0),
            child: icon,
          ),
            Text("$title"),
          ],
        ),
        Icon(Icons.navigate_next)
      ],
    );
  }

}
