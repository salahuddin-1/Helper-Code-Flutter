import 'package:flutter/cupertino.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ShowToast {
  static ToastFuture toast(BuildContext context, String text) {
    return showToast(
      text,
      context: context,
      position: StyledToastPosition.center,
      animation: StyledToastAnimation.fadeScale,
      animDuration: Duration(milliseconds: 100),
      duration: Duration(seconds: 3),
    );
  }
}
