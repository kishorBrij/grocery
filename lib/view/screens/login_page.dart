import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/utils/app_dimension.dart';
import 'package:grocery/viewModel/user_view_model.dart';
import 'package:provider/provider.dart';
import '../../network/app_url.dart';
import '../../resource/auth_method.dart';
import '../../routes/app_routes_constant.dart';
import '../../utils/app_style.dart';
import '../../utils/color.dart';
import '../../utils/image.dart';
import '../../utils/utils.dart';
import '../../viewModel/auth_view_model.dart';
import 'navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController countryCode = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();

  final PrefService _prefService = PrefService();

  @override
  void initState() {
    // TODO: implement initState
    countryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                AppImage.appLogo,
                height: 100,
                width: 100,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 25),
              alignment: Alignment.center,
              child: const Text(
                "Enter Your Mobile Number",
                style: h1Style,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.only(left: 15),
              height: 55,
              decoration: decorationBorder,
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    child: TextField(
                      readOnly: true,
                      controller: countryCode,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  Text(
                    "|",
                    style: TextStyle(color: AppColor.grey, fontSize: 33),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextField(
                    controller: mobileController,
                    keyboardType: TextInputType.number,
                    cursorColor: AppColor.btnColor,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Phone Number"),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: AppDimension.height(context) * .03,
            ),
            GestureDetector(
              onTap: () {
                if (mobileController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter mobileNo', context);
                } else if (mobileController.text.trim().length <= 9) {
                  Utils.flushBarErrorMessage(
                      'Please enter 10 digit Mobile Number', context);
                } else {
                  authViewMode.mobileApi(
                      {"mobile": mobileController.text.trim()},
                      context
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 45,
                width: double.infinity,
                decoration: decoration,
                child: const Text(
                  "Continue",
                  style: appbarStyle,
                ),
              ),
            ),
            SizedBox(
              height: AppDimension.height(context) * .03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),
                const Text("OR"),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),
              ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 45,
                width: double.infinity,
                decoration:
                    decoration.copyWith(color: AppColor.grey.withOpacity(.2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 35,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Continue With Facebook', style: h1Style)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () async {
                bool res = await _authMethods.signInWithGoogle(context);
                if (res) {
                  // ignore: use_build_context_synchronously
                  GoRouter.of(context)
                      .pushNamed(AppConstantRoute.navigationRoute, extra: 0);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const NavigationScreen(page: 0,)),
                  // );
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 45,
                width: double.infinity,
                decoration:
                    decoration.copyWith(color: AppColor.grey.withOpacity(.2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImage.google,
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Continue With Google',
                      style: h1Style,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 45,
                width: double.infinity,
                decoration:
                    decoration.copyWith(color: AppColor.grey.withOpacity(.2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.apple_outlined,
                      color: Colors.black,
                      size: 35,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Continue With Apple',
                      style: h1Style,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
