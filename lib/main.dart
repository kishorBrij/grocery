import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery/provider/data/banner_data.dart';
import 'package:grocery/provider/data/recently_view_data.dart';
import 'package:grocery/provider/data/shop_bycategory_data.dart';
import 'package:grocery/routes/app_route_config.dart';
import 'package:grocery/viewModel/auth_view_model.dart';
import 'package:grocery/viewModel/preProvider.dart';
import 'package:grocery/viewModel/user_view_model.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PrefService.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PrefProvider()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
         ChangeNotifierProvider(create: (context)=>HomeCategory()),
        ChangeNotifierProvider(create: (context)=>BannerData()),
        ChangeNotifierProvider(create: (context)=>RecentProduct())
      ],
      child: MaterialApp.router(
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        title: 'Grocery',
        darkTheme: ThemeData.dark(useMaterial3: true,),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routeInformationParser:AppRoutes.router.routeInformationParser ,
        routerDelegate:AppRoutes.router.routerDelegate,
        routeInformationProvider: AppRoutes.router.routeInformationProvider,
      ),
    );
  }
}


