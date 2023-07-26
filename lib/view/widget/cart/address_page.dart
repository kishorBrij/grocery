import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/utils/app_dimension.dart';
import 'package:grocery/view/customWidget/textField_custom.dart';
import 'package:grocery/view/widget/cart/chose_address.dart';
import 'package:provider/provider.dart';
import '../../../provider/data/address_data.dart';
import '../../../routes/app_routes_constant.dart';
import '../../../utils/app_style.dart';
import '../../../utils/color.dart';
import '../../../viewModel/auth_view_model.dart';
import '../../customWidget/custom_button.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key, required this.data}) : super(key: key);
  final Map<String , dynamic> data;
  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String? address;
  String? work;
  String? method;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final authViewMode = Provider.of<AuthViewModel>(context,listen: false);

    authViewMode.getGetAddressGet(context);
  }
  @override
  Widget build(BuildContext context) {

    final authViewMode = Provider.of<AuthViewModel>(context);

    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: CustomButton(
          onTapPress: () {
            authViewMode.placeOrderGet(
                {

                  "reg_id": widget.data["reg_id"],
                  "product_id":  widget.data["product_id"].toString(),
                  "product_name": widget.data["product_name"].toString(),
                  "quantity": widget.data["quantity"].toString(),
                  "order_id": DateTime.now().millisecondsSinceEpoch.toString(),
                  "price": widget.data["price"].toString(),
                  "discount": widget.data["discount"].toString(),
                  "images": widget.data["images"].toString(),
                  "billing_name":  authViewMode.myGetAddressData.last["name"].toString(),
                  "billing_mobile":  authViewMode.myGetAddressData.last["mobile"].toString(),
                  "billing_email":  authViewMode.myGetAddressData.last["email"].toString(),
                  "billing_pin":authViewMode.myGetAddressData.last["pincode"].toString(),
                  "billing_flat_no":authViewMode.myGetAddressData.last["flat_no"].toString(),
                  "billing_landmark": authViewMode.myGetAddressData.last["landmark"].toString(),
                  "billing_state":authViewMode.myGetAddressData.last["area"].toString(),
                  "billing_city":authViewMode.myGetAddressData.last["city"].toString(),



                },
                context);
          },
          textButton: "Place Order",
          style: appbarStyle,
        ),
      ),
      appBar: AppBar(
        elevation: 5,
        iconTheme: IconThemeData(color: AppColor.btnColor),
        title: const Text(
          "Choose Order",
          style: h1Style,
        ),
        actions: [
          // PopupMenuButton<int>(
          //   itemBuilder: (context) => [
          //     PopupMenuItem(
          //       value: 1,
          //       child: ListTile(
          //         onTap: () {
          //
          //         },
          //         leading: const Text(
          //           "Add Address",
          //           style: smallStyle,
          //         ),
          //       ),
          //     ),
          //   ],
          //   offset: const Offset(0, 20),
          //   color: Colors.black,
          //   elevation: 2,
          //   onSelected: (value) {},
          // ),
           Padding(
             padding: const EdgeInsets.only(right:10.0),
             child: GestureDetector(
               onTap:(){

                 Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const ChooseAddress())
                 );
               },
                 child: const Icon(Icons.add,size: 30,)),
           )
        ],
      ),
      body: ListView(
        children: [
          Column(
              children: authViewMode.myGetAddressData
                  .map((e) => Row(
                        children: [
                          Radio(
                            value: "office",
                            groupValue: address,
                            activeColor: AppColor.secondry,
                            onChanged: (value) {
                              setState(() {
                                address = value.toString();
                              });
                            },
                          ),
                          Container(
                            width: AppDimension.width(context) * .83,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: AppColor.btnColor.withOpacity(.1),
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e["name"].toString(),
                                      style: subTitleBoldText,
                                    ),
                                    Icon(
                                      Icons.delete,
                                      color: AppColor.location,
                                      size: 20,
                                    )
                                  ],
                                ),
                                Text(
                                  e["mobile"].toString(),
                                  style: subTitleBoldText,
                                ),
                                Text(
                                  e["email"].toString(),
                                  style: subTitleBoldText,
                                ),
                                Text(
                                  e["pincode"].toString(),
                                  style: subTitleBoldText,
                                ),
                                Text(
                                  e["flat_no"].toString(),
                                  style: subTitleBoldText,
                                ),
                                Text(
                                  e["area"].toString(),
                                  style: subTitleBoldText,
                                ),
                                Text(
                                  e["landmark"].toString(),
                                  style: subTitleBoldText,
                                ),
                                Text(
                                  e["city"].toString(),
                                  style: subTitleBoldText,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                  .toList()),
          SizedBox(
            height: AppDimension.height(context) * .051,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: "work",
                  groupValue: work,
                  activeColor: AppColor.secondry,
                  onChanged: (value) {
                    setState(() {
                      work = value.toString();
                    });
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 70,
                  decoration: decoration,
                  child: const Text(
                    "Office",
                    style: appbarStyle,
                  ),
                ),
                Radio(
                  value: "home",
                  groupValue: work,
                  activeColor: AppColor.secondry,
                  onChanged: (value) {
                    setState(() {
                      work = value.toString();
                    });
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 70,
                  decoration: decoration,
                  child: const Text(
                    "Home",
                    style: appbarStyle,
                  ),
                ),
                Radio(
                  value: "Other",
                  groupValue: work,
                  activeColor: AppColor.secondry,
                  onChanged: (value) {
                    setState(() {
                      work = value.toString();
                    });
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 70,
                  decoration: decoration,
                  child: const Text(
                    "Other",
                    style: appbarStyle,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: AppDimension.height(context) * .05,
          ),
          Row(
            children: [
              Radio(
                value: "payment",
                groupValue: method,
                activeColor: AppColor.secondry,
                onChanged: (value) {
                  setState(() {
                    method = value.toString();
                  });
                },
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const Text(
                    "Cash On Delivery",
                    style: h1Style,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                value: "online",
                groupValue: method,
                activeColor: AppColor.secondry,
                onChanged: (value) {
                  setState(() {
                    method = value.toString();
                  });
                },
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const Text(
                    "Online",
                    style: h1Style,
                  )),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const CustomTextField(
              hintText: "Additional Note",
              maxLines: 5,
            ),
          ),
        ],
      ),
    );
  }
}
