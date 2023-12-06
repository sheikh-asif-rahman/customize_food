import 'package:customize_food/Screens/Seller/Dashboard/dashboard.dart';
import 'package:customize_food/screens/buyer/orders/order_list.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import '../Screens/Seller/Add_menu/menu.dart';
import '../Screens/Seller/Profile/profile.dart';

class HiddenDrawerSeller extends StatefulWidget {
  const HiddenDrawerSeller({super.key});

  @override
  State<HiddenDrawerSeller> createState() => _HiddenDrawerSellerState();
}

class _HiddenDrawerSellerState extends State<HiddenDrawerSeller> {
  //list holds all the pages name and path as variable _pages//
  List<ScreenHiddenDrawer> _pages = [];
  //drawer unselected menu text color//
  final textstyle1 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: Colors.white,
  );
  //drawer selected menu text color//
  final textstyle2 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: Colors.blue,
  );
  @override
  void initState() {
    super.initState();
    _pages = [
      //first page of drawer-----dashboard//
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Home Page",
            baseStyle: textstyle1,
            selectedStyle: textstyle2,
            colorLineSelected: Colors.pink,
          ),
          DashboardPageSeller()),

      //second page of drawer-----Menu
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Menu",
            baseStyle: textstyle1,
            selectedStyle: textstyle2,
            colorLineSelected: Colors.pink,
          ),
          Menu()),
      //   //4th page of drawer--------Order List

      //   //6th page of drawer---------- User Detail
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Profile",
            baseStyle: textstyle1,
            selectedStyle: textstyle2,
            colorLineSelected: Colors.pink,
          ),
          SellerProfile()),
    ];
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: HiddenDrawerMenu(
        styleAutoTittleName: const TextStyle(fontSize: 35),
        backgroundColorMenu: Colors.black45,
        backgroundColorAppBar: Colors.blue[900],
        screens: _pages,
        initPositionSelected: 0,
        slidePercent: 60,
        contentCornerRadius: 30,
      ),
    );
  }
}
