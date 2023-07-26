import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/utils/app_dimension.dart';
import 'package:provider/provider.dart';
import '../../../provider/data/cart_data.dart';
import '../../../routes/app_routes_constant.dart';
import '../../../utils/app_style.dart';
import '../../../utils/color.dart';
import '../../../viewModel/auth_view_model.dart';
import '../../screens/drawer_page.dart';
class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  late AuthViewModel authViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     authViewModel = Provider.of<AuthViewModel>(context,listen: false);
  }

  void _incrementCounter(int i) {
    int counter=authViewModel.myCartData[i];
    setState(() {
      counter++;
      cartData[i].count = counter;

    });
    newPrice=double.parse(authViewModel.myCartData[i]["price"].toString())*cartData[i].count;
  }
  void _decrementCounter(int i) {
    int counter= cartData[i].count;
    setState(() {
      counter--;
      if(counter==0){
        counter=1;
      }
      cartData[i].count = counter;

    }); newPrice=double.parse(authViewModel.myCartData[i]["price"].toString())*cartData[i].count;
  }
  double newPrice=0;


  getCount(int i){
    newPrice=double.parse(authViewModel.myCartData[i]["price"].toString())*cartData[i].count;
    

  }
  @override
  Widget build(BuildContext context) {

    final authViewMode = Provider.of<AuthViewModel>(context);
    authViewMode.getMyCartGet(context);
    // log("1111123${ authViewMode.myCartData}");
    return Scaffold(
      drawer: const DrawerPage(),
      appBar: AppBar(
        //  backgroundColor: AppColor.btnColor,
        elevation: 5,
        iconTheme: IconThemeData(color: AppColor.btnColor),
        title: const Text(
          "My Cart",
          style: h1Style,
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          GestureDetector(
            onTap:(){

            },
            child: Container(
              alignment: Alignment.center,
              height: 45,
              width: 180,
              decoration: BoxDecoration(
                  color: AppColor.grey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(0)
              ),
              child:Text("₹ $newPrice",style: h1Style,),
            ),
          ),
          Expanded(
              child: GestureDetector(
                onTap:(){
                  GoRouter.of(context).pushNamed(AppConstantRoute.addressRoute,extra: authViewMode.myCartData.first);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                      color:AppColor.btnColor,
                      borderRadius: BorderRadius.circular(0)
                  ),
                  child:const Text("Placed Items",style: appbarStyle,),
                ),
              ))
        ],
      ),
      body:ListView.builder(

        itemCount: authViewMode.myCartData.length,

          itemBuilder: (context,index){

          getCount(index);
        return  Container(
          margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          width: MediaQuery.of(context).size.width,
          decoration: decoration.copyWith(color: AppColor.grey.withOpacity(0.1)),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(jsonDecode( authViewMode.myCartData[index]["images"])[0]
              ,height: 100,
                width: 70,
              ),
              const SizedBox(width:10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   SizedBox(
                     width: AppDimension.width(context)*.65,
                       child: Text( authViewMode.myCartData[index]["product_name"],style:h4StyleLight)),
                  const SizedBox(height: 5,),
                   Text("₹ ${authViewMode.myCartData[index]["price"]}",style: h4StyleLight,),
                  const SizedBox(height: 5,),
                  Row(
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
                          cartData[index].count.toString(),
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
                ],
              ),
              GestureDetector(
                onTap:(){
                  setState(() {
                    cartData.removeAt(index);
                  });
                },
                  child: const Icon(Icons.delete,color: Colors.red,))
            ],
          ),
        );
      }),
    );
  }
}
