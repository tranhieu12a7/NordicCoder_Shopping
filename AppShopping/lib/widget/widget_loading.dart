

import 'package:flutter/material.dart';

class WidgetLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      // height: heightScreen != 0 ? heightScreen : 75.0,
        alignment: Alignment.center,
        child: CircularProgressIndicator()
    );
  }
}
