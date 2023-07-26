

import 'package:flutter/foundation.dart';

import '../../model/banner_model.dart';
import '../../utils/image.dart';

List<BannerModel>bannerData=[
  BannerModel(image: AppImage.banner5),
  BannerModel(image: AppImage.banner2),
  BannerModel(image: AppImage.banner6),
  BannerModel(image: AppImage.banner4),
];

class BannerData extends ChangeNotifier{
   List _bannerList=[];
  List get bannerList =>_bannerList;


  int _currentIndex = 0;
   int get currentIndex =>_currentIndex;


  getBannerList(List list){
    _bannerList=list;
    // notifyListeners();
  }

  setCurrentIndex(int i){
    _currentIndex = i;
    notifyListeners();
   }
}