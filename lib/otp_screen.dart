import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasyapp/phone.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: const Color(0xFF93D2F3),
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color(0xFF93D2F3),
      ),
    );

    var code = '';

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var fwidth = constraints.maxWidth;
      var fheigth = constraints.maxHeight;
      return Scaffold(
        key: _scaffoldkey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).maybePop();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  SizedBox(
                    width: fwidth * 0.8,
                  ),
                ],
              ),
              SizedBox(
                height: fheigth * 0.1,
                width: fwidth,
              ),
              const SizedBox(
                child: Text('Verify Phone',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto-Regular')),
              ),
              SizedBox(
                height: fheigth * 0.02,
              ),
              SizedBox(
                width: fwidth * 0.6,
                child: const Text(
                  'Code is sent to',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto-Regular',
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: fheigth * 0.05,
              ),
              SizedBox(
                  width: fwidth * 0.9,
                  child: Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    closeKeyboardWhenCompleted: true,
                    onChanged: (value) {
                      code = value;
                    },
                  )),
              SizedBox(
                height: fheigth * 0.02,
              ),
              SizedBox(
                width: fwidth * 0.6,
                child: const Text(
                  'Didn\'t receive the code?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto-Regular',
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: fheigth * 0.05,
              ),
              SizedBox(
                width: fwidth * 0.9,
                height: fheigth * 0.08,
                child: TextButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: Phone.verifyID, smsCode: code);

                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, '/Profile');
                    } catch (e) {
                      FocusScope.of(context).unfocus();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Invalid OTP"),
                        duration: Duration(seconds: 2),
                      ));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF2e3b62),
                    ),
                  ),
                  child: const Text(
                    'VERIFY AND CONTINUE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0),
                  ),
                ),
              ),
            ],
          )),
        ),
      );
    });
  }
}
