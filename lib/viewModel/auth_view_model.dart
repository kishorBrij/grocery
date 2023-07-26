

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/resource/auth_repository.dart';
import 'package:grocery/viewModel/user_view_model.dart';

import '../routes/app_routes_constant.dart';
import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier{

  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  dynamic _profileData ;
 dynamic get profileData => _profileData;

  List _bannerData =[];
  List get bannerData => _bannerData;

  List _singleBannerData =[];
  List get singleBannerData => _singleBannerData;

  List _categoryData = [];
  List get categoryData => _categoryData;

  List _topCategoryData = [];
  List get topCategoryData => _topCategoryData;

  List _recentCategoryData = [];
  List get recentCategoryData => _recentCategoryData;

  List _getProductData = [];
  List get getProductData => _getProductData;

  List _myCartData = [];
  List get  myCartData =>  _myCartData;

  List _myOrderData = [];
  List get  myOrderData => _myOrderData;

  List _myGetAddressData = [];
  List get  myGetAddressData => _myGetAddressData;


  setLoading(bool value){
    _loading = value;
   // notifyListeners();
  }




  Future<void> mobileApi(dynamic data, BuildContext context)async{

    setLoading(true);
    _myRepo.mobileApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('Login Successfully', context);
     // GoRouter.of(context).pushNamed(AppConstantRoute.navigationRoute,extra: 0);

      GoRouter.of(context).pushNamed(AppConstantRoute.otpRoute);
      if(kDebugMode){
        print(value.toString());
      }

      // log("after Login ${value}");
      PrefService().setRegId(value["reg_id"].toString());
      PrefService().setMobile(data["mobile"].toString());
      PrefService().setUserSession(true);

    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> profileGet( BuildContext context)async{

    setLoading(true);
    _myRepo.profileApi().then((value) {
      _profileData = value;
     notifyListeners();
      setLoading(false);
     // Utils.flushBarErrorMessage('Data Loaded', context);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> updateGet(dynamic data, BuildContext context)async{


    setLoading(true);
    _myRepo.updateApi(data).then((value) {

      // Utils.flushBarErrorMessage('update Successfully', context);
      Utils.toastMessage('update Successfully');
      // GoRouter.of(context).pushNamed(AppConstantRoute.profileRoute);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> bannerGet( BuildContext context)async{

    setLoading(true);
    _myRepo.bannerApi().then((value) {
      _bannerData = value;
      notifyListeners();
      setLoading(false);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> singleBannerGet( BuildContext context)async{

    setLoading(true);
    _myRepo.singleBannerApi().then((value) {
      _singleBannerData = value;
      notifyListeners();
      setLoading(false);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> categoryGet( BuildContext context)async{

    setLoading(true);
    _myRepo.categoryApi().then((value) {
      _categoryData = value;
      notifyListeners();
      setLoading(false);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> topCategoryGet( BuildContext context)async{

    setLoading(true);
    _myRepo.topCategoryApi().then((value) {
      _topCategoryData = value;
      notifyListeners();
      setLoading(false);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> recentCategoryGet(dynamic data, BuildContext context)async{



    setLoading(true);
    _myRepo.recentCategoryApi(data).then((value) {
      _recentCategoryData = value;
      setLoading(false);
      // Utils.flushBarErrorMessage('Upload Successfully', context);

      if(kDebugMode){
        print(value.toString());
      }


    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> getProductGet( BuildContext context,catId)async{

    setLoading(true);
    _myRepo.getProductApi(catId).then((value) {
      _getProductData = value;
      notifyListeners();
      setLoading(false);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> addToCartGet(dynamic data, BuildContext context)async{


    setLoading(true);
    _myRepo.addToCartApi(data).then((value) {

      // Utils.flushBarErrorMessage('update Successfully', context);
      Utils.toastMessage('Add to Cart Successfully');
      // GoRouter.of(context).pushNamed(AppConstantRoute.profileRoute);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> placeOrderGet(dynamic data, BuildContext context)async{


    setLoading(true);
    _myRepo.placeOrderApi(data).then((value) {


      Utils.toastMessage('Place Order Successfully');
      // GoRouter.of(context).pushNamed(AppConstantRoute.profileRoute);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> getMyCartGet( BuildContext context)async{

    setLoading(true);
    _myRepo.myCartApi().then((value) {
      _myCartData = value;
      notifyListeners();
      setLoading(false);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> getMyOrderGet( BuildContext context)async{

    setLoading(true);
    _myRepo.myOrderApi().then((value) {
      // log("message1111$value");
      _myOrderData = value;
      notifyListeners();
      setLoading(false);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> chooseAddressGet(dynamic data, BuildContext context)async{


    setLoading(true);
    _myRepo.chooseAddressApi(data).then((value) {


      Utils.toastMessage('Add address Successfully');
      // GoRouter.of(context).pushNamed(AppConstantRoute.profileRoute);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> getGetAddressGet( BuildContext context)async{

    setLoading(true);
    _myRepo.getAddressApi().then((value) {
      // log("message1111$value");
      _myGetAddressData = value;
      notifyListeners();
      setLoading(false);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> getCancelGet( BuildContext context,String orderId)async{

    setLoading(true);
    _myRepo.getCancelApi(orderId).then((value) {
      Utils.toastMessage('Cancel Order Successfully');
      notifyListeners();
      setLoading(false);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

}