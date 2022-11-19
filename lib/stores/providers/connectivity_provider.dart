import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_updated_boilerplate/utils/app_utils/connectivity_check.dart';
import 'package:flutter/cupertino.dart';

class ConnectivityProvider extends ChangeNotifier {
  bool _result = true;

  bool get isOffline => !_result;

  setConnectivityResult(ConnectivityResult res, BuildContext context) {
    sleep(const Duration(milliseconds: 200));
    isNetworkAvailable().then((status) {
      _result = status;
      notifyListeners();
    });
  }
}
