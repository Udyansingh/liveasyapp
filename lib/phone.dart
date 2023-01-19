import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  static String verifyID = '';

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  final countryPicker = const FlCountryCodePicker();
  final TextEditingController controller = TextEditingController();
  CountryCode countryCode =
      const CountryCode(name: 'India', code: 'IN', dialCode: '+91');

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var fwidth = constraints.maxWidth;
      var fheigth = constraints.maxHeight;
      return Scaffold(
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
                      icon: const Icon(Icons.close)),
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
                child: Text('Please enter your mobile number',
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
                  'You\'ll recieve a 4 digit code to verify next',
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
              Container(
                width: fwidth * 0.9,
                decoration: BoxDecoration(border: Border.all(width: 1.0)),
                child: TextFormField(
                  controller: controller,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 13.0),
                      hintText: 'Mobile Number',
                      border: InputBorder.none,
                      prefixIcon: GestureDetector(
                        onTap: () async {
                          final code =
                              await countryPicker.showPicker(context: context);
                          setState(() {
                            countryCode = code!;
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: fwidth * 0.05,
                            ),
                            Container(
                              // ignore: unnecessary_null_comparison
                              child: countryCode != null
                                  ? countryCode.flagImage
                                  : countryCode.flagImage,
                            ),
                            SizedBox(
                              width: fwidth * 0.01,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(countryCode.dialCode,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16)),
                            ),
                            SizedBox(
                              width: fwidth * 0.05,
                              child: const Text(
                                '-',
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                      )),
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
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: countryCode.dialCode + controller.text,
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        Phone.verifyID = verificationId;
                        Navigator.pushNamed(context, '/OtpScreen');
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF2e3b62),
                    ),
                  ),
                  child: const Text(
                    'CONTINUE',
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
