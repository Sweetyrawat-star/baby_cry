import 'package:flutter/material.dart';

import 'ColorUtils.dart';

class DialogUtils {
  static AlertDialog? _progress;

  static void showProgress(BuildContext context, {String msg = "Please wait"}) {
    if (context == null) {
      return;
    }
    if (_progress == null) {
      var bodyProgress = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircularProgressIndicator(
            backgroundColor: ColorUtils.greyColor.withOpacity(0.5),
            value: null,
            valueColor: AlwaysStoppedAnimation<Color>(ColorUtils.greyColor.withOpacity(0.5)),
            strokeWidth: 2.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 25.0),
            child: Text(
              msg,
              style: TextStyle(color: ColorUtils.greyColor),
            ),
          ),
        ],
      );
      _progress = AlertDialog(
        content: bodyProgress,
      );
    }
    showDialog(context: context, builder: (context) => _progress!, barrierDismissible: true);
  }

  static void hideProgress(BuildContext context) {
    if (context == null) {
      return;
    }
    if (_progress != null) {
      Navigator.pop(context);
      _progress = null;
    }
  }

  static void showMessageDialog(BuildContext context, String msg) {
    AlertDialog dialog = AlertDialog(
      content: Text(
        msg,
        style: TextStyle(color: Colors.blue),
      ),
      actions: <Widget>[
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("ok", style: TextStyle(color: Colors.blue)),
        )
      ],
    );
    showDialog(context: context, builder: (context) => dialog);
  }
}
