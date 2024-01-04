import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PrintUtils.dart';

class AppUtils {
  static void refreshCurrentState(State state) {
    if(state.mounted) {
      state.setState(() {});
    }
  }

  static Future<bool> configApp() async {
    Timer.periodic(Duration(seconds: 10), (_timer) {
      _timer.cancel();

    });
    return true;
  }



  static Future<bool> isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if ((result?.length ?? 0) > 0 &&
          ((result[0].rawAddress?.length ?? 0) > 0)) {
        return true;
      }
    } on SocketException catch (_) {
      PrintUtils.printLog('not connected');
    }

    return false;
  }


  static bool isValid(bool value, {bool ?defaultReturn}) {
    if (value != null) {
      return value;
    }
    if (defaultReturn != null) {
      return defaultReturn;
    }
    return false;
  }

  static int getValue(int value, {int ?defaultReturn}) {
    if (value != null) {
      return value;
    }
    if (defaultReturn != null) {
      return defaultReturn;
    }
    return 0;
  }
}
