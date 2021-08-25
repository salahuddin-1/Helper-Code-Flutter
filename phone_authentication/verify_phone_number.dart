import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mandimarket/src/resources/errors.dart';
import 'package:mandimarket/src/resources/navigation.dart';
import 'package:mandimarket/src/resources/phone_number_services.dart';
import 'package:mandimarket/src/widgets/toast.dart';

class VerifyPhoneNumber {
  final _auth = FirebaseAuth.instance;

  final _phoneNumberServices = new PhoneNumberServices();

  Future verifyPhone(String phoneNumber, BuildContext context) async {
    _auth
        .verifyPhoneNumber(
      phoneNumber: "+91" + phoneNumber,
      timeout: Duration(seconds: 90),
      verificationCompleted: (credential) {
        _onVerificationCompleted(credential, context);
      },
      codeSent: (verificationId, [forceResendingToken]) {
        _showDialogForCodeSent(context, verificationId, forceResendingToken!);
      },
      verificationFailed: (exception) {
        ShowToast.toast(ErrorCustom.error(exception), context, 4);
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    )
        .catchError(
      (err) {
        ShowToast.toast(ErrorCustom.error(err), context, 4);
      },
    );
  }

  void _onVerificationCompleted(
    AuthCredential credential,
    BuildContext context,
  ) async {
    await _phoneNumberServices.verificationCompleted(credential).then(
      (user) {
        if (user.uid == _auth.currentUser!.uid) {
          ShowToast.toast("Verification Completed", context, 4);
        } else {
          print("User not equals to");
        }
      },
    ).catchError(
      (err) {
        ShowToast.toast(ErrorCustom.error(err), context, 4);
      },
    );
  }

  void _onCodeSent(
    String verificationId,
    int token,
    BuildContext context,
    String otp,
  ) async {
    await _phoneNumberServices
        .codeSent(
      verificationId,
      token,
      smsCode: otp,
    )
        .then(
      (user) {
        if (user.uid == _auth.currentUser!.uid) {
          Pop(context);
          ShowToast.toast("Code sent verification succesfull", context, 5);
        } else {
          print("User not equals to");
        }
      },
    ).catchError(
      (err) {
        ShowToast.toast(ErrorCustom.error(err), context, 4);
      },
    );
  }

  final _otpCntrl = TextEditingController();
  _showDialogForCodeSent(
    BuildContext context,
    String verificationId,
    int token,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter OTP'),
          content: TextFormField(
            controller: _otpCntrl,
            maxLength: 6,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _onCodeSent(
                  verificationId,
                  token,
                  context,
                  _otpCntrl.text.trim(),
                );
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
