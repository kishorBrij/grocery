import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:grocery/utils/image.dart';
import 'package:grocery/view/customWidget/textField_custom.dart';
import 'package:provider/provider.dart';
import '../../../controller/camera_control.dart';
import '../../../utils/app_style.dart';
import '../../../utils/color.dart';
import '../../../viewModel/auth_view_model.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key, this.data}) : super(key: key);

  final Map<String,dynamic>? data;

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final Methods methods = Methods();

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
    // log("ProfileData : ${widget.data}");
    final authViewMode = Provider.of<AuthViewModel>(context,listen: false);

    nameController.text = widget.data!["name"] ??"";
    mobileController.text = widget.data!["mobile"] ??"";
    emailController.text = widget.data!["email"].toString() ?? "";
    pinCodeController.text = widget.data!["pincode"].toString() ?? "";
    flatNoController.text = widget.data!["flat_no"].toString() ?? "";
    areaController.text = widget.data!["area"].toString() ??"";
    landmarkController.text = widget.data!["landmark"].toString() ??"";
    cityController.text = widget.data!["city"].toString() ??"";
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    return Scaffold(
      bottomNavigationBar:GestureDetector(
        onTap:(){
         authViewMode.updateGet({
           "name":nameController.text.trim(),
           "mobile":mobileController.text.trim(),
           "email":emailController.text.trim(),
           "pincode":pinCodeController.text.trim(),
           "flat_no":flatNoController.text.trim(),
           "area":areaController.text.trim(),
           "landmark":landmarkController.text.trim(),
           "city":cityController.text.trim(),
           "profile_pic":""

         }, context);
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
        title: const Text("Add Address",style: h1Style,),
      ),
      body:ListView(
        children: [
          Container(
            margin:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            height: 45,
            width: double.infinity,
            decoration: decorationBorder,
            alignment: Alignment.center,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_searching,color: AppColor.location,),
                const SizedBox(width: 15,),
                Text("Use Current Location",style: textColor,)

              ],
            ),
          ),
          const Divider(),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children:  [
                CircleAvatar(
                  radius:45,
                  backgroundColor: AppColor.btnColor,
                  backgroundImage:AssetImage(AppImage.banner4),
                ),
                Positioned(
                  bottom: -20,
                    child: IconButton(onPressed:(){
                      methods.pickImage().then((value) {
                        // log("message${value!.path}");
                      });
                    },
                        icon: Icon(Icons.camera_alt,color: AppColor.btnColor,)))
              ],
            ),
          ),
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
