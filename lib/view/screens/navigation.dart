import 'dart:developer';

import 'package:flutter/material.dart';

import '../../utils/app_style.dart';
import '../../utils/color.dart';
import '../widget/cart/cart_page.dart';
import '../widget/category/category_page.dart';
import '../widget/home/home_page.dart';
import '../widget/order/order_page.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key, required this.page}) : super(key: key);

  final int page;
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  int _selectedIndex = 0;
  static  final List _widgetOptions = <dynamic>[
     const HomeScreen(),
     const CategoriesPage(),
     const OrderPage(),
     const CartPage()
  ];

  void _onItemTapped( index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.page!=null){
      _selectedIndex = widget.page!;
    }

    // log("message${widget.page}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColor.textWhite,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon:Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.dashboard_outlined),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.shopping_bag_outlined),
              label: 'My Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart_outlined),
              label: 'Cart',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor:AppColor.btnColor,
          unselectedItemColor:AppColor.grey,
          iconSize: 25,
          unselectedLabelStyle:subTitleBoldText,
          selectedLabelStyle: subTitleBoldText ,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
