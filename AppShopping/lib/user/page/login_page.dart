import 'package:AppShopping/user/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:vietinfo_dev_core/vietinfo_dev_core.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailText = new TextEditingController();
  TextEditingController passwordText = new TextEditingController();

  UserBloc bloc;

  bool isShowPass=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc=UserBloc(context);

    emailText.text="test5@gmail.com";
    passwordText.text="123456";

  }

  void inContact(TapDownDetails details) {
    setState(() {
      isShowPass = true;
    });
  }

  void outContact(TapUpDetails details) {
    setState(() {
      isShowPass=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    core.init(context);
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
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.keyboard_backspace,
                    color: Colors.white,
                    size: 30,
                  )),
              Expanded(
                child: Center(
                    child: Text(
                  "Đăng nhập",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                      TextSpan(text: "EMAIL", style: TextStyle(color: Colors.grey)),
                      TextSpan(text: "*", style: TextStyle(color: Colors.red)),
                    ])),
                TextField(
                  controller: emailText,
                  decoration: InputDecoration(
                    hintText: "Nhập email",
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(text: "MẬT KHẨU", style: TextStyle(color: Colors.grey)),
                          TextSpan(text: "*", style: TextStyle(color: Colors.red)),
                        ])),
                    GestureDetector(
                        onTapDown: inContact,//call this method when incontact
                        onTapUp: outContact,//call this method when contact with screen is removed
                        child: Icon(Icons.remove_red_eye))
                  ],
                ),


                TextField(
                  controller: passwordText,
                  obscureText: !isShowPass,
                  decoration: InputDecoration(
                    hintText: "Nhập mật khẩu",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: core.screenSize.height / 15,
            ),
            GestureDetector(
              onTap: (){
                bloc.callLogin(context: context,userName: emailText.text,password: passwordText.text);
              },
              child: Container(
                width: core.screenSize.width,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                    child: Text(
                  "ĐĂNG NHẬP",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
            SizedBox(
              height: core.screenSize.height / 15,
            ),
            InkWell(
              onTap: (){
                bloc.callPageRegister(context: context);
              },
              child: RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: "Bạn chưa có tài khoản ? ",
                    style: TextStyle(
                      color: Colors.grey
                    )
                  ),
                  TextSpan(
                      text: "Đăng ký",style: TextStyle(
                    color: Colors.orange,fontWeight: FontWeight.bold,fontSize: core.getFontSize(16)
                  )
                  ),
                ]
              )),
            )
            
          ],
        ),
      ),
    );
  }
}
