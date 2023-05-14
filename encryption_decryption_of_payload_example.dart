import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class EncryptionDecryptionOfPayloadExample {
  /// Using [AES] Algorithm
  void encryptSampleDataUsingAES() {
    // Sample data to be encrypted
    final requestData = {
      'username': 'john',
      'password': 'secret',
    };

    // Encryption key and IV (Initialization Vector)
    final key = Key.fromLength(32); // 256-bit key
    final iv = IV.fromLength(16); // 128-bit IV

    // This will generate random keys instead of [0, 0, 0.....]
    //  final key = encrypt.Key.fromSecureRandom(32);
    // final iv = encrypt.IV.fromSecureRandom(16);

    // Create an AES encrypter with the key and IV
    final encrypter = Encrypter(
      AES(key),
    );

    // Serialize the request data to JSON
    final jsonData = json.encode(requestData);

    // Encrypt the JSON payload
    final encryptedData = encrypter.encrypt(jsonData, iv: iv);

    // Encrypted data and IV to be sent in the request
    final encryptedPayload = encryptedData.base64;
    final ivBase64 = iv.base64;

    // Send the request to the server
    // Send the encrypted request with the payload and IV
    // Perform the HTTP request with the encrypted payload and IV
    // (Implementation of sending the request is application-specific)
    print('Sending encrypted request...');
    print('Encrypted Payload: $encryptedPayload');
    print('IV: $ivBase64');

    // For Decryption call this method
    decryptSampleDataUsingAES(
      encryptedPayload: encryptedPayload,
      key: key.base64,
      iv: ivBase64,
    );
  }

  /// Using [AES] Algorithm
  void decryptSampleDataUsingAES({
    // Encrypted data received from the server
    // Pass with the actual encrypted payload
    required String encryptedPayload,
    // Pass with the actual encryption key
    required String key,
    // Pass with the actual IV
    required String iv,
  }) {
    // Create an AES decrypter with the key and IV
    final encrypter = Encrypter(
      AES(
        Key.fromBase64(key),
      ),
    );

    // Decrypt the payload using AES
    final decryptedData = encrypter.decrypt64(
      encryptedPayload,
      iv: IV.fromBase64(iv),
    );

    // Deserialize the decrypted JSON payload
    final decryptedPayload = json.decode(decryptedData);

    // Process the decrypted payload here
    print('Decrypted Payload: $decryptedPayload');
  }
}
