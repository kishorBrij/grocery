import 'package:flutter/cupertino.dart';
import 'package:grocery/utils/image.dart';
import '../../model/recently_product_model.dart';

List<RecentlyViewModel>recentlyViewData=[
  RecentlyViewModel(image: AppImage.mango, pName: "Banganapalli Mango", price: "₹80.00", discount: "₹100.00", off: "20% off",quantity: "1 Kg"),
  RecentlyViewModel(image: AppImage.coconuts, pName: "Tender Coconut - Medium", price: "₹80.00", discount: "₹100", off: "20% off",quantity: "1.5 Kg"),
  RecentlyViewModel(image: AppImage.orange, pName: "Fresh Orange", price: "₹80.00", discount: "₹100.00", off: "20% off",quantity: "2 Kg"),
  RecentlyViewModel(image: AppImage.palak, pName: "Fresh Palak", price: "₹80.00", discount: "₹100.75", off: "20% off",quantity: "2.5 Kg"),
  RecentlyViewModel(image: AppImage.mango, pName: "Fresh Mango", price: "₹80.00", discount: "₹100.00", off: "20% off",quantity: "3 Kg"),
];

class RecentProduct extends ChangeNotifier{
  List _recentList=[];
  List get recentData=>_recentList;

  getRecentData(List list){
    _recentList=list;
    // notifyListeners();

}
}