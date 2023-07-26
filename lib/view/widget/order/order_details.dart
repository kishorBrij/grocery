import 'dart:convert';
import 'dart:developer';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:grocery/utils/app_dimension.dart';
import 'package:grocery/view/customWidget/custom_button.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_style.dart';
import '../../../utils/color.dart';
import '../../../viewModel/auth_view_model.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key, required this.data}) : super(key: key);
  final Map<String , dynamic> data;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}
int _index = 0;


List<StepperData> stepperData = [
  StepperData(
      title: StepperText(
        "Order Placed",
        textStyle:  TextStyle(
          color: AppColor.grey,
        ),
      ),
      subtitle: StepperText("Your order has been placed"),
      iconWidget: Container(
        padding: const EdgeInsets.all(4),
        decoration:  const BoxDecoration(
            color:Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Icon(Icons.done, color: Colors.white,size:15,),
      )),
  StepperData(
      title: StepperText("Preparing"),
      subtitle: StepperText("Your order is being prepared"),
      iconWidget: Container(
        padding: const EdgeInsets.all(4),
        decoration:  const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Icon(Icons.done, color: Colors.white,size: 15,),
      )),
  StepperData(
      title: StepperText(
        "On the way",
      ),
      subtitle: StepperText(
          "Our delivery executive is on the way to deliver your item"),
      iconWidget: Container(
        padding: const EdgeInsets.all(4),
        decoration:  const BoxDecoration(
            color:Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Icon(Icons.done, color: Colors.white,size: 15,),
      )),
  StepperData(
    title: StepperText("Delivered",
        textStyle: const TextStyle(
          color: Colors.grey,
        )),
  ),
];


class _OrderDetailsState extends State<OrderDetails> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final authViewMode = Provider.of<AuthViewModel>(context);
    // log("message0009");
  }
  @override
  Widget build(BuildContext context) {

    final authViewMode = Provider.of<AuthViewModel>(context);
    // log("message9090${widget.data}");
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: CustomButton(
            onTapPress: () {
              authViewMode.getCancelGet(context,widget.data["order_id"].toString());
            },
            textButton: "Cancel Order",
            style: appbarStyle,
          ),
        ),
        appBar: AppBar(
          elevation: 5,
          title: const Text(
            "Order",
            style: h1Style,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, top: 15),
                child: Row(
                  children:  [
                    const Text(
                      'Order id :',
                      style: h4StyleLight,
                    ),
                    Text(
                      widget.data["product_id"].toString(),
                      style: h4StyleLight,
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Row(
                  children:  [
                    Text(
                      widget.data["order_date"].toString(),
                      style: textStyle,
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                      width: AppDimension.width(context) * .75,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                           Text(
                             widget.data["product_name"].toString(),style: h1Style,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                           Text(
                              widget.data["quantity"].toString(),  style: h1Style
                          ),
                          Row(
                            children:  [
                                Text(
                                 "₹ ${widget.data["price"]}",
                                style: h1Style,
                              ),
                              // const SizedBox(width: 10,),
                              // Text("₹ 4599.00",style: colorDiscountStyle,),
                              // const SizedBox(width: 10,),
                              // Text("10% Off",style: colorTextStyle,)
                            ],
                          )
                        ],
                      ),
                    ),
                    Image.network(
                    jsonDecode ( widget.data["images"])[0],
                      height: 70,
                      width: 70,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 20),
                child: AnotherStepper(
                  stepperList: stepperData,
                  stepperDirection: Axis.vertical,
                  iconWidth: 25,
                  iconHeight: 25,
                  activeBarColor: AppColor.btnColor,
                  inActiveBarColor: AppColor.grey,
                  inverted: false,
                  verticalGap: 20,
                  activeIndex: 1,
                  barThickness:2,
                ),
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: const Text(
                  "Shipping Details-",
                  style: subtitleText,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Text(
                  widget.data["billing_name"],
                  style: smallBlackStyle,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child:  Text(
                  widget.data["billing_flat_no"].toString(),
                  style: smallBlackStyle,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child:  Text(
                  widget.data["billing_city"].toString(),
                  style: smallBlackStyle,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Text(
                  widget.data["billing_state"].toString(),
                  style: smallBlackStyle,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child:  Text(
                  widget.data["billing_pin"].toString(),
                  style: smallBlackStyle,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child:  Text(
                  widget.data["billing_mobile"].toString(),
                  style: smallBlackStyle,
                ),
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: const Text(
                  "Price Details",
                  style: h1Style,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: const Text(
                      "List price",
                      style: smallBlackStyle,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 5, right: 15),
                    child: Text(
                      "₹2500.00",
                      style: discountStyle,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: const Text(
                      "Selling Price",
                      style: smallBlackStyle,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 5, right: 15),
                    child:  Text(
                        "₹ ${widget.data["price"]}", style: smallBlackStyle
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      "Total Amount",
                      style: colorTextStyle,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 15, top: 5, right: 15, bottom: 15),
                    child: Text(
                        "₹ ${widget.data["price"]}", style: colorTextStyle),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
