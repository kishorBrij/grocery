import 'package:flutter/material.dart';

import '../../model/shop_by_category_model.dart';
import '../../utils/image.dart';


List<ShopByCategoryModel>categoryData=[
  ShopByCategoryModel(image: AppImage.milk, categoryName: "Milk"),
  ShopByCategoryModel(image: AppImage.banana, categoryName: "Banana"),
  ShopByCategoryModel(image: AppImage.apple, categoryName: "Apple"),
  ShopByCategoryModel(image: AppImage.palak, categoryName: "Palak"),
  ShopByCategoryModel(image: AppImage.orange, categoryName: "Orange"),
  ShopByCategoryModel(image: AppImage.coconuts, categoryName: "Coconut"),
  ShopByCategoryModel(image: AppImage.mango, categoryName: "Mango"),
  ShopByCategoryModel(image: AppImage.fruits, categoryName: "Fruits"),
];

List<TopFruitsVegModel>topFruitsVegData=[
  TopFruitsVegModel(image:  AppImage.mango, pName: "Mango"),
  TopFruitsVegModel(image:  AppImage.palak, pName: "Palak"),
  TopFruitsVegModel(image:  AppImage.coconuts, pName: "Coconut"),
  TopFruitsVegModel(image:  AppImage.fruits, pName: "Fruits"),
];

class HomeCategory extends ChangeNotifier{

  List _categoryList = [];

  List get categoryList => _categoryList;


  getCategory(List list){
    _categoryList = list;
    // notifyListeners();
  }
}
