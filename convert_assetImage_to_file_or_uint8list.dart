import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
//   path_provider: ^2.0.2

// Load an asset Image from assets and convert it into a File
// And you can also convert it into Uint8List by files.readAsBytesSync
convertAssetToFile() async {
  // The root bundle contains all the asset files
  // the load method gives us the file as bytes
  final byteData = await rootBundle.load("assets/images/logo.png");

  // Get the temporary directory
  final tempDir = await getApplicationDocumentsDirectory();

  // The File() class creates an empty file with the particular path provided
  final file = File("${tempDir.path}");

  // file.writeAsBytes writes the content provided in the empty file
  await file.writeAsBytes(
    byteData.buffer.asUint8List(
      byteData.offsetInBytes,
      byteData.lengthInBytes,
    ),
  );

  // Reads the file as Bytes
  File readFile = file.readAsBytesSync();

  return file;
}
