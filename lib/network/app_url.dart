

class AppConstant {
  static var appName = 'Grocery';

  static var appVersion = 1.0;

  static var baseUrl = 'https://grocery.preciousresidency.com/api';

  static var mobileUrl = '$baseUrl/users/login';

  static var profileUrl = '$baseUrl/users/';

  static var updateUrl = '$baseUrl/users/1688472589131';

  static var bannerUrl = '$baseUrl/banner/';

  static var singleBannerUrl = '$baseUrl/banner/single/';

  static var categoryUrl = '$baseUrl/category/';

  static var topCategoryUrl = '$baseUrl/products/top/v1';

  static var recentCategoryUrl = '$baseUrl/products/recent/1688472589131';

  // static var recentlyUrl = '$baseUrl/products/recent/1688472589131';

  static var getProductUrl = '$baseUrl/products/category/';

  static var addToCartUrl = '$baseUrl/cart';

  static var placeOrderUrl = '$baseUrl/order';

  static var myCartUrl = '$baseUrl/cart/';

  static var myOrderUrl = '$baseUrl/order/';

  static var chooseAddressUrl = '$baseUrl/users/address/';

  static var getAddressUrl = '$baseUrl/users/address/';

  static var getCancelUrl = '$baseUrl/order/cancel/';




  /// constant variable data

  static String regId="";
  static String mobile="";
  static bool userSession = false;

  /// Shared Preference Keys ///

  static String regIdKey="regIdKey";
  static String mobileNoKey="mobileNoKey";
  static String userSessionKey="userSessionKey";


}