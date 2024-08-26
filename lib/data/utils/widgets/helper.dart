import 'package:fluttertoast/fluttertoast.dart';

class Helper {
  static showToast(
      {required String msg,
      ToastGravity? gravity}) {
    return Fluttertoast.showToast(
        gravity: gravity,
        msg: msg);
  }
}
