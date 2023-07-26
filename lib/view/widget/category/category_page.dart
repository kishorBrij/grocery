import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import '../../../provider/data/all_Category_data.dart';
import '../../../routes/app_routes_constant.dart';
import '../../../utils/app_style.dart';
import '../../../utils/color.dart';
import '../../../viewModel/auth_view_model.dart';
import '../../screens/drawer_page.dart';
import 'category_screns.dart';
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authViewModel= Provider.of<AuthViewModel>(context,listen: false);
    authViewModel.categoryGet(context);

  }

  @override
  Widget build(BuildContext context) {

    final authViewMode = Provider.of<AuthViewModel>(context);
    // log("message${authViewMode.categoryData}");
    return Scaffold(
      drawer: const DrawerPage(),
      appBar: AppBar(
        //  backgroundColor: AppColor.btnColor,
        elevation: 5,
        iconTheme: IconThemeData(color: AppColor.btnColor),
        title: const Text(
          "Moti nagar New Delhi",
          style: h1Style,
        ),
        actions: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(AppConstantRoute.searchRoute);
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed(AppConstantRoute.navigationRoute,extra: 3);

                },
                icon: badges.Badge(

                  badgeContent: Text(cartList.length.toString(),style: appbarStyle,),
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                )),
          )
        ],
      ),
      body: Row(
        children: <Widget>[
          SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height,),
                child: IntrinsicHeight(
                  child: NavigationRail(
                    selectedLabelTextStyle: subTitleBoldText,
                    unselectedLabelTextStyle:smallBlackStyle,
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                      authViewMode.getProductGet(context,authViewMode.categoryData[index]["cat_id"].toString());
                    },
                    labelType: NavigationRailLabelType.selected,
                    destinations:
                    authViewMode.categoryData.map((e) =>  NavigationRailDestination(
                          icon: Column(
                            children: [
                              Container(
                                height: 70,
                                width: 50,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [AppColor.btnColor.withOpacity(0.3), AppColor.textWhite],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    image:  DecorationImage(image:
                                    NetworkImage(e["image"])
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Text(e["title"],style:smallBlackStyle,textAlign: TextAlign.center,)
                            ],
                          ),
                          // selectedIcon: Column(
                          //   children: [
                          //     Container(
                          //       height: 70,
                          //       width: 50,
                          //       decoration: BoxDecoration(
                          //           gradient: LinearGradient(
                          //             colors: [AppColor.secondry.withOpacity(0.3), AppColor.textWhite],
                          //             begin: Alignment.topCenter,
                          //             end: Alignment.bottomCenter,
                          //           ),
                          //           image: DecorationImage(image:
                          //           NetworkImage(e["image"])
                          //           ),
                          //           borderRadius: BorderRadius.circular(10)),
                          //     ),
                          //     Text(e["title"],style:smallBlackStyle,textAlign: TextAlign.center,)],
                          // ),
                          label: const Text("")
                      )).toList()
                  ),
                ),
              )
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Center(
              child: CategoryScreens(index: _selectedIndex,),
            ),
          )
        ],
      ),
    );
  }
}
