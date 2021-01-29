import 'package:flutter/material.dart';
import 'package:vietinfo_dev_core/vietinfo_dev_core.dart';

class GioHangPage extends StatefulWidget {
  @override
  _GioHangPageState createState() => _GioHangPageState();
}

class _GioHangPageState extends State<GioHangPage> {
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
                     "Cá nhân",
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
      ),
    );
  }
}
