import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/utils/app_style.dart';
import 'package:grocery/utils/color.dart';
import '../../routes/app_routes_constant.dart';
import '../../utils/image.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}
bool iconBool = false;

class _DrawerPageState extends State<DrawerPage> {

  bool isSwitched = false;
  IconData iconLight = Icons.wb_sunny;
  IconData iconDark = Icons.nights_stay;
  // ThemeData lightTheme =
  //     ThemeData(primarySwatch: Colors.amber, brightness: Brightness.light);
  // ThemeData darkTheme =
  //     ThemeData(primarySwatch: Colors.red, brightness: Brightness.dark);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 220,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: AppColor.btnColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(AppImage.otp),
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Pankaj Ka Codes',
                    style: appbarStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
          SizedBox(
            height:50,
            child: ListTile(
              leading: Icon(Icons.person, color: AppColor.btnColor),
              title: const Text('Profile', style: textStyle),
              onTap: () {
                GoRouter.of(context).pushNamed(AppConstantRoute.profileRoute);
              },
            ),
          ),
          SizedBox(
            height:50,
            child: ListTile(
              leading: Icon(Icons.shopping_bag, color: AppColor.btnColor),
              title: const Text('My Order', style: textStyle),
              onTap: () {
                GoRouter.of(context)
                    .pushNamed(AppConstantRoute.navigationRoute, extra: 2);
              },
            ),
          ),
          SizedBox(
            height:50,
            child: ListTile(
              leading: Icon(Icons.add_shopping_cart_outlined,
                  color: AppColor.btnColor),
              title: const Text('Cart', style: textStyle),
              onTap: () {
                GoRouter.of(context)
                    .pushNamed(AppConstantRoute.navigationRoute, extra: 3);
              },
            ),
          ),
          SizedBox(
            height:50,
            child: ListTile(
              leading: Icon(Icons.details, color: AppColor.btnColor),
              title: const Text('About', style: textStyle),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            height:50,
            child: ListTile(
              leading: Icon(Icons.color_lens, color: AppColor.btnColor),
              title: const Text(
                'Dark Theme',
                style: textStyle,
              ),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      iconBool = !iconBool;
                    });
                  },
                  icon: Icon(iconBool ? iconDark : iconLight)),
              // trailing: Switch(
              //   value: isSwitched,
              //   onChanged: (value) {
              //     setState(() {
              //       isSwitched = value;
              //     });
              //   },
              //   activeTrackColor: AppColor.btnColor,
              //   activeColor: Colors.white,
              //
              // ),
              onTap: () {},
            ),
          ),
          SizedBox(
            height:50,
            child: ListTile(
              leading: Icon(Icons.share, color: AppColor.btnColor),
              title: const Text('App Share', style: textStyle),
              onTap: () {

              },
            ),
          ),
          SizedBox(
            height:50,
            child: ListTile(
              leading: Icon(Icons.privacy_tip_outlined, color: AppColor.btnColor),
              title: const Text('Privacy Policy', style: textStyle),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            height:50,
            child: ListTile(
              leading: Icon(Icons.privacy_tip, color: AppColor.btnColor),
              title: const Text('Term & Condition', style: textStyle),
              onTap: () {},
            ),
          ),
          SizedBox(
            height:50,
            child: ListTile(
              leading: Icon(Icons.logout, color: AppColor.btnColor),
              title: const Text('LogOut', style: textStyle),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
