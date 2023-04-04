import 'dart:convert';
import 'dart:typed_data';

class Base64PDFParser {
  static Uint8List? getBytes(String? image) {
    if (image == null || image.isEmpty) return null;

    try {
      final bytes = base64Decode(image);
      return bytes;
    } catch (e) {
      return null;
    }
  }

  // Get The Path of the convereted file
  String? parseBase64PDF(String? base64) async {
    // The file was corrupted
    final bytes = getBytes(base64);

    if (bytes == null) return null;

    try {
      Directory? directory;

      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        // [ANDROID]
        directory = Directory('/storage/emulated/0/Download');

        bool directoryExists = await directory.exists();

        if (!directoryExists) {
          directory = await getExternalStorageDirectory();
        }
        print(directoryExists);
      }

      String? path = directory?.path;

      if (path == null) {
        return null;
      }

      final file = File("$path/${params.docId}.pdf");

      await file.writeAsBytes(
        params.bytes!.buffer.asUint8List(),
      );

      return file.path;
    } on Exception catch (e) {
      return null;
    }
  }
}
