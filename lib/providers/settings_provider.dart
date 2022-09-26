import 'package:ecomstore/models/shopitem.dart';
import 'package:ecomstore/repository/ecomstore_repository.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  String serverUrl = "http://10.0.2.2:3000";

  void changeServerUrl(String url) {
    serverUrl = url;
    notifyListeners();
  }
}
