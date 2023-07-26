import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../provider/data/order_data.dart';
import '../../../routes/app_routes_constant.dart';
import '../../../utils/app_style.dart';
import '../../../utils/color.dart';
import '../../../viewModel/auth_view_model.dart';
import '../../customWidget/textField_custom.dart';
import '../../screens/drawer_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key,}) : super(key: key);



  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authViewModel = Provider.of<AuthViewModel>(context,listen: false);
    authViewModel.getMyOrderGet(context);
  }
  @override
  Widget build(BuildContext context) {

    final authViewMode = Provider.of<AuthViewModel>(context);
    // log("message123${authViewMode.myOrderData}");
    return Scaffold(
      drawer: const DrawerPage(),
      appBar: AppBar(
        //  backgroundColor: AppColor.btnColor,
        elevation: 5,
        iconTheme: IconThemeData(color: AppColor.btnColor),
        title: const Text(
          "My Orders",
          style: h1Style,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CustomTextField(
                hintText: "Search Your Order",
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColor.btnColor,
                  size: 30,
                ),
              ),
            ),
            Column(
              children: authViewMode.myOrderData
                  .map((e) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 7),
                        padding: const EdgeInsets.only(top: 5, bottom: 5,left: 10),
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(.1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(
                                jsonDecode(e["images"])[0],
                                height: 100,
                                width: 70,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  e["product_name"],
                                  style: h1Style,
                                ),
                                Text(
                                  e["delivery_status"],
                                  style: titleGrey,
                                ),
                                Text(
                                  "₹"+" "+e["price"].toString(),
                                  style: textStyle,
                                ),
                                RatingBar.builder(
                                  itemSize: 25,
                                  initialRating: 1,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.green,
                                  ),
                                  onRatingUpdate: (rating) {
                                    if (kDebugMode) {
                                      print(rating);
                                    }
                                  },
                                ),
                                TextButton(
                                    onPressed: () {
                                      GoRouter.of(context).pushNamed(AppConstantRoute.reviewRoute);
                                    },
                                    child: const Text("Write a Review"))
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            IconButton(onPressed:(){
                               GoRouter.of(context).pushNamed(AppConstantRoute.orderRoute,extra: e);
                            },
                                icon:const Icon(Icons.arrow_forward_ios))
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
