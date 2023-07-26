import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grocery/network/app_url.dart';
import 'package:grocery/viewModel/user_view_model.dart';




class PrefProvider extends ChangeNotifier {
  final PrefService _prefService = PrefService();

  PrefProvider() {
    getRegId();
    getMobile();
  }

  /// getting RegId
  Future<void> getRegId() async {
    AppConstant.regId = await _prefService.getRegId();
    // log("message${_prefService.getRegId()}");
    notifyListeners();
  }

  /// getting Mobile
  Future<void> getMobile() async {
    AppConstant.mobile = await _prefService.getMobile();
    notifyListeners();
  }

  /// getting User Session
  Future<void> getUserSession() async {
    AppConstant.userSession = await _prefService.getUserSession() ?? false;
    notifyListeners();
  }
}