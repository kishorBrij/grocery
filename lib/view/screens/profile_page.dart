import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/routes/app_routes_constant.dart';
import 'package:grocery/utils/image.dart';
import 'package:provider/provider.dart';

import '../../utils/app_style.dart';
import '../../utils/color.dart';
import '../../viewModel/auth_view_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authViewMode = Provider.of<AuthViewModel>(context,listen: false);

    authViewMode.profileGet(context);


  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);

    var data = authViewMode.profileData;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        iconTheme: IconThemeData(color: AppColor.btnColor),
        title: const Text(
          "Profile Page",
          style: h1Style,
        ),
      ),
      body: data!=null? Padding(
        padding: const EdgeInsets.only(top:2.0),
        child: Container(
          height: 180,
          color: AppColor.secondry,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const  EdgeInsets.only(top:10,left:5) ,
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        radius: 40,
                        backgroundColor:AppColor.textWhite,
                        backgroundImage: AssetImage(AppImage.banner4)),
                    const SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                            data["name"] ??"" ,
                            style: appbarStyle
                        ),
                        Text(
                            data!["email"] ??"" ,
                            style: appbarStyle
                        ),
                        Text(
                            data!["mobile"] ??"" ,
                            style: appbarStyle
                        ),
                      ],
                    ),
                    const SizedBox(width: 10,),
                    IconButton(onPressed: (){
                      GoRouter.of(context).pushNamed(AppConstantRoute.addAddressRoute,
                          extra:data
                      );
                    },
                        icon: Icon(Icons.edit,color:AppColor.textWhite,size: 30,))

                  ],
                ),
              ),
              Container(
                margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.textWhite,
                  borderRadius: BorderRadius.circular(5)
                ),
                child:  ListTile(
                  leading: const Icon(Icons.location_on,color: Colors.red,),
                  title:  Text(
                   data!["area"]+" "+data!["landmark"]+" "+data!["city"],
                    style:smallBlackStyle,
                  ),

                ),
              )
            ],
          ),
        ),
      ) : const SizedBox(),
    );
  }
}
