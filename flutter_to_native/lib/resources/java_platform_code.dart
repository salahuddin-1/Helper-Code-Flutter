import 'package:flutter/services.dart';

class JavaPlatformCode {
  // Channel for communicating with native platform
  // Channel name should be same as channel name in java
  static const platform = const MethodChannel("flutter.native/helper");

  Future<String> callMethod() async {
    String response = "";
    try {
      // 'helloFromNativeCode' is name of the method (must be unique)
      // We'll write a method in java with same name which will return same result of same datatype
      // We''ll do this asynchronously
      // We'll use try catch for catching errors
      final String result = await platform.invokeMethod("helloFromNativeCode");
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to invoke: '${e.message}'.";
    }

    return response;
  }
}
