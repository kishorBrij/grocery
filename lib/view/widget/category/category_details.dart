import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;
import 'package:grocery/utils/image.dart';
import 'package:grocery/view/customWidget/custom_button.dart';
import 'package:provider/provider.dart';
import '../../../provider/data/similar_data.dart';
import '../../../routes/app_routes_constant.dart';
import '../../../utils/app_style.dart';
import '../../../utils/color.dart';
import '../../../viewModel/auth_view_model.dart';
import '../../../viewModel/user_view_model.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({Key? key, required this.data}) : super(key: key);

  final Map<String , dynamic> data;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int pageIndex = 0;
  void _incrementCounter(int i) {
    int counter= similarProductData[i].count;
    setState(() {
      counter++;
      similarProductData[i].count = counter;
    });

  }
  void _decrementCounter(int i) {
    int counter= similarProductData[i].count;
    setState(() {
      counter--;
      if(counter==0){
        counter=1;
      }
      similarProductData[i].count = counter;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authViewModel= Provider.of<AuthViewModel>(context,listen: false);


    // log("message7895 : ${widget.data}");

  }

  @override
  Widget build(BuildContext context) {

    final authViewMode = Provider.of<AuthViewModel>(context);
    return Scaffold(
      bottomNavigationBar:Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: CustomButton(
          onTapPress:(){
            var p = PrefService();
            var regId = p.getRegId();

            // log("message${widget.data}+$regId");

            authViewMode.addToCartGet(
                {

                  "reg_id": regId.toString(),
                  "product_id": widget.data["product_id"].toString(),
                  "product_name": widget.data["title"].toString(),
                  "quantity": widget.data["unit"].toString(),
                  "price":widget.data["price"].toString(),
                  "discount": "5151",
                  "images":widget.data["images"].toString()

                }
            , context);
          },
          textButton: "ADD TO CART",style: appbarStyle,
        ),
      ),
      appBar: AppBar(
        //  backgroundColor: AppColor.btnColor,
        elevation: 5,
        iconTheme: IconThemeData(color: AppColor.btnColor),
        title: const Text(
          "Category Details",
          style: h1Style,
        ),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       GoRouter.of(context).pushNamed(AppConstantRoute.searchRoute);
          //     },
          //     icon: const Icon(
          //       Icons.search,
          //       size: 30,
          //     )),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed(AppConstantRoute.navigationRoute,extra: 3);

                },
                icon: badges.Badge(

                  badgeContent: Text(similarProductData.length.toString(),style: appbarStyle,),
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                )),
          )
        ],
      ),
      body:SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 270,
              width: double.infinity,
              child: Center(
                  child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          pageIndex = value;
                        });
                      },
                      itemCount: (jsonDecode(widget.data["images"]).length),
                      itemBuilder: (context, index) {
                        return Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                const EdgeInsets.symmetric(horizontal: 10, vertical:10),
                                height: 250,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                   jsonDecode(widget.data["images"]
                                )[index],
                              ),
                                ))
                            ],
                          ),
                        );
                      })),
            ),
            Container(
              alignment: Alignment.center,
              height:10,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (jsonDecode(widget.data["images"]).length),
                  shrinkWrap: true,

                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        alignment: Alignment.center,
                        height:10,
                        width: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == pageIndex ? AppColor.secondry : AppColor.btnColor),
                      ),
                    );
                  }),
            ),
           Padding(
             padding: const EdgeInsets.only(right: 15.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColor.textWhite,
                  child:Image.asset(AppImage.share,height: 30,),

                )
               ],

             ),
           ),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
             child: Text(
               widget.data["title"],
               style: textStyle,),
           ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child:RichText(
                text:  TextSpan(
                  text: 'MRP ',
                  style: TextStyle(color: AppColor.grey,fontSize:18,fontFamily: "Avalon_Bold"),
                  children: <TextSpan>[
                     TextSpan(
                        text:"₹${widget.data["old_price"]}",
                        style: discountStyle),
                     TextSpan(text:" " "₹${widget.data["price"]}",style: h1Style),
                     TextSpan(
                       text:" "'${calculatePercentage(
                         double.parse  ( widget.data["price"].toString()),
                           double.parse(  widget.data["old_price"].toString()),
                           ).toStringAsFixed(2)}%',style: colorTextStyle
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child:const Text("Free Delivery on orders over ₹499.00",style: textStyle,),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  RatingBar.builder(
                    itemSize: 20,
                    initialRating: 0,
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
                      print(rating);
                    },
                  ),
                  const SizedBox(width: 10,),
                  const Text("(157)",style:smallBlackStyle,)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child:const Text("Bought Together",style: h1Style,),
            ),
            Container(
              height: 210,
              padding: const EdgeInsets.only(top: 5,bottom: 5),
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
              margin:const EdgeInsets.symmetric(horizontal: 5),
              child:ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:authViewMode.recentCategoryData.length,
                  itemBuilder: (context,index){
                    return Container(
                      margin:const EdgeInsets.symmetric(horizontal: 5),
                      width: 110,
                      decoration: BoxDecoration(
                          border: Border.all( color: AppColor.btnColor,),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 5,),
                         Image.network( jsonDecode( authViewMode.recentCategoryData[index]["images"])[0],
                            height: 80,width: 80,),
                          const SizedBox(height: 5,),
                          Text(authViewMode.recentCategoryData[index]["title"],style: smallBlackStyle,textAlign: TextAlign.center ,),
                          Text(authViewMode.recentCategoryData[index]["unit"],style: smallBlackStyle,textAlign: TextAlign.center ,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text( "₹"+" "+authViewMode.recentCategoryData[index]["price"].toString(),style: smallBlackStyle,textAlign: TextAlign.center ,),
                              const SizedBox(width:5),
                              Text( "₹"+" "+authViewMode.recentCategoryData[index]["old_price"].toString(),style: discountStyle,textAlign: TextAlign.center ,),
                            ],
                          ),
                          Text("${calculatePercentage(
                            double.parse( authViewMode.getProductData[index]["price"].toString()),
                            double.parse( authViewMode.getProductData[index]["old_price"].toString()),
                          ).toStringAsFixed(2)}%",style: colorTextStyle,textAlign: TextAlign.start ,),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0,bottom:5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _decrementCounter(index);
                                  },
                                  child: Container(
                                    height:25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColor.grey.withOpacity(.3),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                        '-',
                                        style: h1Style
                                    ),
                                  ),
                                ),
                                Container(
                                  height:25,
                                  width:30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColor.grey.withOpacity(.3),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                      similarProductData[index].count.toString(),
                                      style: h1Style
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _incrementCounter(index);
                                  },
                                  child: Container(
                                    height:25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColor.grey.withOpacity(.3),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                        '+',
                                        style: h1Style
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
  double calculatePercentage(double price, double oldPrice) {
    return ((oldPrice-price) / oldPrice) * 100;
  }
}
