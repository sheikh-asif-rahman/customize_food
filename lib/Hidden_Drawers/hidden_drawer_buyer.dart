import 'package:customize_food/Screens/Buyer/Bargenning/buyer_offer_notification.dart';
import 'package:customize_food/screens/buyer/orders/order_list.dart';
import 'package:customize_food/screens/buyer/profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import '../Screens/Buyer/Dashboard/dashboard.dart';
import '../Screens/Buyer/Favourite/favourite.dart';
import '../Screens/Buyer/Statement/statement_details.dart';

class HiddenDrawerBuyer extends StatefulWidget {
  const HiddenDrawerBuyer({super.key});

  @override
  State<HiddenDrawerBuyer> createState() => _HiddenDrawerBuyerState();
}

class _HiddenDrawerBuyerState extends State<HiddenDrawerBuyer> {
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
          DashboardPageBuyer()),

      //second page of drawer-----Favourite Food List
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Favourite",
            baseStyle: textstyle1,
            selectedStyle: textstyle2,
            colorLineSelected: Colors.pink,
          ),
          FavouriteFoodList()),
      //second page of drawer-----Favourite Food List
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Offered",
            baseStyle: textstyle1,
            selectedStyle: textstyle2,
            colorLineSelected: Colors.pink,
          ),
          BuyerOfferNotification()),

      //4th page of drawer--------Order List
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Order List",
            baseStyle: textstyle1,
            selectedStyle: textstyle2,
            colorLineSelected: Colors.pink,
          ),
          OrderList()),

      //5th page of drawer--------- Statement
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Statement",
            baseStyle: textstyle1,
            selectedStyle: textstyle2,
            colorLineSelected: Colors.pink,
          ),
          Statement()),

      //6th page of drawer---------- User Detail
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Profile",
            baseStyle: textstyle1,
            selectedStyle: textstyle2,
            colorLineSelected: Colors.pink,
          ),
          UserProfile()),
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
