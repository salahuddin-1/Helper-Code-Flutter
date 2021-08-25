package com.example.flutter_to_native;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

  // name of the channel, should be same as declared in flutter
  private static final String CHANNEL = "flutter.native/helper";

  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    super.configureFlutterEngine(flutterEngine);

    new MethodChannel(
      flutterEngine.getDartExecutor().getBinaryMessenger(),
      CHANNEL
    )
    .setMethodCallHandler(
        (call, result) -> {
          if (call.method.equals("helloFromNativeCode")) {
            String greetings = helloFromNativeCode();
            result.success(greetings);
          }
        }
      );
  }

  private String helloFromNativeCode() {
    return "Hello World from Native Android Code";
  }
}
