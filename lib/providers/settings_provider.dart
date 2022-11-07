import 'package:ecomstore/models/shopitem.dart';
import 'package:ecomstore/repository/ecomstore_repository.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  String serverUrl = "http://127.0.0.1:5019";

  void changeServerUrl(String url) {
    serverUrl = url;
    notifyListeners();
  }
}
