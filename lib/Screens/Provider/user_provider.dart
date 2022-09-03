import 'package:elibrary/dataModels/User_model.dart';
import 'package:flutter/material.dart';


class UserProvider extends ChangeNotifier {
  UserModel? Userdata;

  setWeCodeUser(UserModel user) {
    Userdata = user;
    debugPrint('from provider : ' + Userdata.toString());
    notifyListeners();
  }
}