
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grocery/utils/image.dart';
import 'package:grocery/view/customWidget/textField_custom.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_style.dart';
import '../../../utils/color.dart';
import '../../../viewModel/auth_view_model.dart';

class ChooseAddress extends StatefulWidget {
  const ChooseAddress({Key? key,}) : super(key: key);


  @override
  State<ChooseAddress> createState() => _ChooseAddressState();
}

class _ChooseAddressState extends State<ChooseAddress> {

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController flatNoController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController cityController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);

    return Scaffold(
      bottomNavigationBar:GestureDetector(
        onTap:(){


          authViewMode.chooseAddressGet(
              {
            "name":nameController.text.trim(),
            "mobile":mobileController.text.trim(),
            "email":emailController.text.trim(),
            "pincode":pinCodeController.text.trim(),
            "flat_no":flatNoController.text.trim(),
            "area":areaController.text.trim(),
            "landmark":landmarkController.text.trim(),
            "city":cityController.text.trim(),


          }
          , context);
          Navigator.pop(context);
        },
        child:Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          width: double.infinity,
          decoration: decoration,
          child:const Text("Submit",style: appbarStyle,),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColor.textWhite,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.textBlack),
        shape: const Border(
            bottom: BorderSide(
                color: Colors.grey,
                width:1
            )
        ),
        title: const Text("Choose Address",style: h1Style,),
      ),
      body:ListView(
        children: [

          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child:  CustomTextField(
                controller: nameController,
                label: "Name",
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child:  CustomTextField(
                controller: mobileController,
                label: 'Mobile Number',
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child:  CustomTextField(
                controller: emailController,
                label: 'Email',
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: CustomTextField(
                controller: pinCodeController,
                label: "Pin Code",
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: CustomTextField(
                controller: flatNoController,
                label: 'Flat no,house etc',
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: CustomTextField(
                controller:areaController ,
                label: 'Area,Colony,village,street',
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: CustomTextField(
                controller: landmarkController,
                label: 'Landmark',
              )),

          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child:  CustomTextField(
                controller: cityController,
                label: "Town/City",
              )),
        ],
      ),
    );
  }
}
