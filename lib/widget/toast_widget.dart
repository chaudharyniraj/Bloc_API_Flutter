import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  void toastMessage() {
    Fluttertoast.showToast(
        msg: "Register Sucessful ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }
}
