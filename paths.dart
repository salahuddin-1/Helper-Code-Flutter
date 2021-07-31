import 'package:path_provider/path_provider.dart';

// path_provider: ^2.0.2

getPaths() async {
  // Get Cache directory / Can be cleared anytime
  final tempDir = await getTemporaryDirectory();
  final appDir = await getApplicationDocumentsDirectory();

  final tempPath = tempDir.path;
  //    /data/user/0/com.example.export_hanzala/cache

  final appPath = appDir.path;
  //    /data/user/0/com.example.export_hanzala/app_flutter

  print(tempPath.path);
  print(appPath.path);
}
