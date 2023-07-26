
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/app_routes_constant.dart';
import '../../../utils/app_dimension.dart';
import '../../../utils/app_style.dart';
import '../../../utils/image.dart';
import '../../customWidget/custom_button.dart';
import 'otp_field.dart';
import 'package:go_router/go_router.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: CustomButton(
          onTapPress:(){
            GoRouter.of(context).pushNamed(AppConstantRoute.navigationRoute,extra: 0);
          },
          textButton:'Continue', style: appbarStyle,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Image.asset(AppImage.otp,height:AppDimension.height(context)*.4,),
            Container(
              padding: const EdgeInsets.all(15),
              child: const Text(
                "Enter the four digit code send to your mobile Number.",
                style: h1Style,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Center(child: OtpPage()),
            ),
          ],
        ),
      )),
    );
  }
}
