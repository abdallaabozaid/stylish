import 'package:flutter/cupertino.dart';

class AppCommonCommands {
  static void goBack(BuildContext context, bool? backBool) {
    Navigator.pop(context, backBool);
  }

  static void goToAndReplace(BuildContext context, String screen,
      {Object? arguments}) {
    Navigator.pushReplacementNamed(context, screen, arguments: arguments);
  }

  static void dismissKeyBoard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}







      // color: Theme.of(context).backgroundColor,
