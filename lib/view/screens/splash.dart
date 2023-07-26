
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../routes/app_routes_constant.dart';
import '../../utils/image.dart';
import '../../viewModel/preProvider.dart';
import '../../viewModel/user_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    final prefProvider = Provider.of<PrefProvider>(context, listen: false);
    prefProvider.getRegId();
    prefProvider.getUserSession();

    checkSession();
  }



  checkSession() {
    var p = PrefService();
    var session = p.getUserSession();
    var regId =   p.getRegId();

    // log("Splash${AppConstant.regId}");
    // log("Splash2 : ${regId}");
    if (session == true && regId != null) {
      _navigethome();
    } else {
      _navigeteLogin();
    }
  }



  _navigethome() async {
    await Future.delayed(const Duration(seconds: 4), () {});
    // ignore: use_build_context_synchronously
    GoRouter.of(context).pushNamed(AppConstantRoute.navigationRoute, extra: 0);
  }

  _navigeteLogin() async {
    await Future.delayed(const Duration(seconds: 4), () {});
    // ignore: use_build_context_synchronously
    GoRouter.of(context).pushNamed(AppConstantRoute.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PrefProvider>(context);

    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImage.appLogo,
              ),
            ),
          ),
        ));
  }
}









// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../routes/app_routes_constant.dart';
// import '../../utils/image.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _navigethome();
//   }
//
//   _navigethome() async {
//     await Future.delayed(const Duration(seconds: 4), () {
//
//     });
//     // ignore: use_build_context_synchronously
//     GoRouter.of(context).pushNamed(AppConstantRoute.loginRoute);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(
//             AppImage.appLogo,
//           ),
//         ),
//       ),
//     ));
//   }
// }
