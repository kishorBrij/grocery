import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/view/widget/category/category_details.dart';
import 'package:grocery/view/widget/order/order_details.dart';
import 'package:grocery/view/widget/order/write_review.dart';
import '../view/screens/error_widget.dart' as e;
import '../view/screens/login_page.dart';
import '../view/screens/navigation.dart';
import '../view/screens/otp/otp_screen.dart';
import '../view/screens/profile_page.dart';
import '../view/screens/splash.dart';
import '../view/widget/cart/add_address.dart';
import '../view/widget/cart/address_page.dart';
import '../view/widget/cart/chose_address.dart';
import '../view/widget/category/category_page.dart';
import '../view/widget/category/sub_category.dart';
import '../view/widget/search_page.dart';
import 'app_routes_constant.dart';

class AppRoutes {

  static final GoRouter router = GoRouter(
      routes: [
        GoRoute(
            name: AppConstantRoute.splashRoute,
            path: "/",
            builder: (BuildContext context, GoRouterState state) {
              return const SplashScreen();
            }),
        GoRoute(
            name: AppConstantRoute.loginRoute,
            path: "/login_page",
            builder: (BuildContext context, GoRouterState state) {
              return const LoginScreen();
            }),
        GoRoute(
            name: AppConstantRoute.otpRoute,
            path: "/otpRoute",
            builder: (BuildContext context, GoRouterState state) {
              return const OtpScreen();
            }),
        GoRoute(
            name: AppConstantRoute.navigationRoute,
            path: "/navigation",
            builder: (BuildContext context, GoRouterState state) {
            var data = state.extra as int?;

              return NavigationScreen(
                page: data!,
              );
            }),
        GoRoute(
            name: AppConstantRoute.searchRoute,
            path: "/search_page",
            builder: (BuildContext context, GoRouterState state) {
              return const SearchPage();
            }),
        GoRoute(
            name: AppConstantRoute.reviewRoute,
            path: "/write_review",
            builder: (BuildContext context, GoRouterState state) {
              return const WriteReview();
            }),
        GoRoute(
            name: AppConstantRoute.orderRoute,
            path: "/order_details",
            builder: (BuildContext context, GoRouterState state) {

              var data = state.extra as Map<String,dynamic>;
              return  OrderDetails(data: data,);
            }),
        GoRoute(
            name: AppConstantRoute.allCategoryRoute,
            path: "/category_page",
            builder: (BuildContext context, GoRouterState state) {
              return const CategoriesPage();
            }),
        GoRoute(
            name: AppConstantRoute.categoryRoute,
            path: "/category_details",
            builder: (BuildContext context, GoRouterState state) {

              var data = state.extra as Map<String,dynamic>;
              return CategoryDetails(data: data,);
            }),
        GoRoute(
            name: AppConstantRoute.addressRoute,
            path: "/address_page",
            builder: (BuildContext context, GoRouterState state) {
              var data = state.extra as Map<String,dynamic>;
              return AddressPage(data: data,);
            }),
        GoRoute(
            name: AppConstantRoute.addAddressRoute,
            path: "/add_address",
            builder: (BuildContext context, GoRouterState state) {

              var data = state.extra as Map<String,dynamic>;
              return  AddAddress(data: data,);
            }),
        GoRoute(
            name: AppConstantRoute.profileRoute,
            path: "/profile_page",
            builder: (BuildContext context, GoRouterState state) {
              return const ProfilePage();
            }),
        GoRoute(
            name: AppConstantRoute.subCategoryRoute,
            path: "/sub_category",
            builder: (BuildContext context, GoRouterState state) {
              return const SubCategory();
            }),
        GoRoute(
            name: AppConstantRoute.subChooseAddressRoute,
            path: "/ChooseAddress",
            builder: (BuildContext context, GoRouterState state) {

              return  const ChooseAddress();
            }),
      ],
      errorBuilder: (context, state) {
        return e.ErrorWidget(error: state.error.toString());
      });
}
