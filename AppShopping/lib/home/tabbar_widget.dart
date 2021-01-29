import 'package:AppShopping/home/bloc/home_bloc.dart';
import 'package:AppShopping/home/page/home_page.dart';
import 'package:AppShopping/user/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with TickerProviderStateMixin {
  TabController _controller;
  int _tab = 0;
  Widget widgetHome;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(initialIndex: 0, length: 2, vsync: this);
    _controller.addListener(() {
      setState(() {
        _tab = _controller.index;
      });
      print("${_controller.index}");
    });
    widgetHome = BlocProvider(
      create: (context) => HomeBloc(),
      child: HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new TabBarView(
        controller: _controller,
        children: <Widget>[
          widgetHome,
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        onTap: (int value) {
          _controller.animateTo(value);
          setState(() {
            _tab = value;
          });
        },
        currentIndex: _tab,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Trang chủ',
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person_outline),
            label: 'Cá nhân',
          ),
        ],
      ),
    );
  }
}
