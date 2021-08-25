import 'package:firebase_auth/firebase_auth.dart';
import 'package:mandimarket/src/resources/errors.dart';

class PhoneNumberServices {
  final _auth = FirebaseAuth.instance;

  Future<User> verificationCompleted(AuthCredential credential) async {
    try {
      final authResult = await _auth.signInWithCredential(credential);
      final user = authResult.user;
      return user!;
    } catch (e) {
      throw ErrorCustom.error(e);
    }
  }

  Future<User> codeSent(
    String verificationId,
    int token, {
    String? smsCode,
  }) async {
    AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode!,
    );
    return verificationCompleted(credential);
  }
}
