

import 'dart:developer';

import '../network/app_url.dart';
import '../network/baseApi_services.dart';
import '../network/networkApi_services.dart';
import '../viewModel/user_view_model.dart';

class AuthRepository {

  final BaseApiServices _apiServices = NetworkApiServices();


  Future<dynamic> mobileApi(dynamic data)async{
    try{

      dynamic response = await _apiServices.getPostApiResponse(AppConstant.mobileUrl, data);
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> profileApi()async{
    try{


      // log("HHHHHHH${AppConstant.profileUrl}1688472589131");
      dynamic response = await _apiServices.getGetApiResponse("${AppConstant.profileUrl}1688472589131");
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> updateApi(dynamic data)async{
    try{

      dynamic response = await _apiServices.getPutApiResponse(AppConstant.updateUrl, data);
      // log("message111$response");
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> bannerApi()async{
    try{

      dynamic response = await _apiServices.getGetApiResponse(AppConstant.bannerUrl);
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> singleBannerApi()async{
    try{

      dynamic response = await _apiServices.getGetApiResponse(AppConstant.singleBannerUrl);
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> categoryApi()async{
    try{

      dynamic response = await _apiServices.getGetApiResponse(AppConstant.categoryUrl );
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> topCategoryApi()async{
    try{

      dynamic response = await _apiServices.getGetApiResponse(AppConstant.topCategoryUrl );
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> recentCategoryApi(dynamic data)async{

    try{

      dynamic response = await _apiServices.getPostApiResponse(AppConstant.recentCategoryUrl, data);
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> getProductApi(catId)async{
    try{

      dynamic response = await _apiServices.getGetApiResponse(AppConstant.getProductUrl +catId);
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> addToCartApi(dynamic data)async{
    try{

      dynamic response = await _apiServices.getPostApiResponse(AppConstant.addToCartUrl, data);
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> placeOrderApi(dynamic data)async{
    try{

      dynamic response = await _apiServices.getPostApiResponse(AppConstant.placeOrderUrl, data);
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> myCartApi()async{
    var p = PrefService();
    var regId =   p.getRegId();
    try{

      dynamic response = await _apiServices.getGetApiResponse(AppConstant.myCartUrl+ regId );
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> myOrderApi()async{
    var p = PrefService();
    var regId =   p.getRegId();
    try{

      dynamic response = await _apiServices.getGetApiResponse(AppConstant.myOrderUrl+ regId );
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> chooseAddressApi(dynamic data)async{

    var p = PrefService();
    var regId =   p.getRegId();
    try{

      dynamic response = await _apiServices.getPostApiResponse(AppConstant.chooseAddressUrl + regId, data);
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> getAddressApi()async{
    var p = PrefService();
    var regId =   p.getRegId();
    try{

      dynamic response = await _apiServices.getGetApiResponse(AppConstant.getAddressUrl+ regId );
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> getCancelApi(String orderId)async{
    var p = PrefService();
    var regId =   p.getRegId();
    try{

      dynamic response = await _apiServices.getPatchApiResponse(AppConstant.getCancelUrl+ orderId);
      return response;
    }catch(e){
      rethrow;
    }
  }

}