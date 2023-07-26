import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/utils/color.dart';
import 'package:grocery/view/customWidget/custom_button.dart';
import 'package:provider/provider.dart';
import '../../../provider/data/all_Category_data.dart';
import '../../../routes/app_routes_constant.dart';
import '../../../utils/app_dimension.dart';
import '../../../utils/app_style.dart';
import '../../../viewModel/auth_view_model.dart';
import 'cart_counter.dart';

class CategoryScreens extends StatefulWidget {
  const CategoryScreens({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<CategoryScreens> createState() => _CategoryScreensState();
}

class _CategoryScreensState extends State<CategoryScreens> {



  @override
  Widget build(BuildContext context) {

    final authViewMode = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: GridView.builder(
        itemCount: authViewMode.getProductData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 4.0,
          childAspectRatio: 0.6,
        ),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap:(){
              GoRouter.of(context).pushNamed(AppConstantRoute.categoryRoute,extra: authViewMode.getProductData[index]);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColor.secondry.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 7,bottom: 5),
                    decoration: BoxDecoration(
                        color: AppColor.textWhite,
                        borderRadius: BorderRadius.circular(0),
                        boxShadow:  [
                          BoxShadow(
                            color: AppColor.textWhite,
                            offset: const Offset(
                              1.0,
                              2.0,
                            ),
                            blurRadius: 2.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color:AppColor.textWhite,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 20.0,
                            spreadRadius: 2.0,
                          ),
                        ]),
                    height: 215,
                    width: AppDimension.width(context) * 0.33,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:NetworkImage(
                                    jsonDecode( authViewMode.getProductData[index]["images"])[0]
                                  )
                              )
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5, left: 9),
                          child: Text(
                              authViewMode.getProductData[index]["title"],
                            style:smallBlackStyle
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 3, left: 10,right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "₹"+" "+ authViewMode.getProductData[index]["price"].toString(),
                                  style:smallBlackStyle
                              ),
                              Text("${calculatePercentage(
                                double.parse( authViewMode.getProductData[index]["price"].toString()),
                                double.parse( authViewMode.getProductData[index]["old_price"].toString()),
                              ).toStringAsFixed(2)}%",style: colorTextStyle,textAlign: TextAlign.start ,),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10,right: 10,top: 0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "₹"+" "+ authViewMode.getProductData[index]["old_price"].toString(),
                                  style:discountStyle
                              ),

                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              height: 30,
                              width:100,
                              child: cartList.contains(allCategoryData[index])?const CartCounter(): CustomButton(
                                onTapPress:(){
                                  cartList.add(allCategoryData[index]);
                                  setState(() {

                                  });
                                },
                                textButton: "ADD",style:smallStyle,
                              )
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
  double calculatePercentage(double price, double oldPrice) {
    return ((oldPrice-price) / oldPrice) * 100;
  }
}
