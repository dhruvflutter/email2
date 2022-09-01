import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class otpdemo extends StatefulWidget {
  const otpdemo({Key? key}) : super(key: key);

  @override
  State<otpdemo> createState() => _otpdemoState();
}

class _otpdemoState extends State<otpdemo> {
  TextEditingController tnumber = TextEditingController();
  TextEditingController tsmscode = TextEditingController();

  String mverificationId = "+91";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Otp"),),
      body: Column(
        children: [
          TextField(controller: tnumber),

          ElevatedButton(onPressed: () async {
            String contactno = tnumber.text;

            await FirebaseAuth.instance.verifyPhoneNumber(
              phoneNumber: '+91$contactno',
              verificationCompleted: (PhoneAuthCredential credential) {},
              verificationFailed: (FirebaseAuthException e) {},
              codeSent: (String verificationId, int? resendToken) {
                mverificationId = verificationId;

              },
              codeAutoRetrievalTimeout: (String verificationId) {},
            );
          }, child: Text("Send otp")),

          TextField(controller: tsmscode),
          ElevatedButton(onPressed: () async {

            String smsCode = tsmscode.text;
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: mverificationId, smsCode: smsCode);
            // Sign the user in (or link) with the credential
            FirebaseAuth.instance
                .signInWithCredential(credential)
                .then((value) {
              print(value);
              if (value.user!.phoneNumber != null) {}
            });
          },
              child: Text("Verify Otp"))
        ],
      ),
    );
  }
}
