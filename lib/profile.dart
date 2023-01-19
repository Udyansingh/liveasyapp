import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _groupValue1 = 1;
  int _groupValue2 = 1;

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
              SizedBox(
                height: fheigth * 0.18,
                width: fwidth,
              ),
              const SizedBox(
                child: Text('Please select your profile',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto-Regular')),
              ),
              SizedBox(
                height: fheigth * 0.04,
                width: fwidth,
              ),
              Container(
                width: fwidth * 0.9,
                height: fheigth * 0.14,
                decoration: BoxDecoration(border: Border.all(width: 2.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Shipper',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing.'),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        child: Transform.scale(
                          scale: 1.25,
                          child: Radio(
                            value: 0,
                            groupValue: _groupValue1,
                            onChanged: (newValue) => setState(() {
                              _groupValue1 = 0;
                              _groupValue2 = 1;
                            }),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: fwidth * 0.01,
                      ),
                      SizedBox(
                          child: Transform.scale(
                        scale: 1.25,
                        child: const Image(
                          image: AssetImage('assets/img_home.png'),
                        ),
                      )),
                      SizedBox(
                        width: fwidth * 0.01,
                      ),
                    ],
                  ),
                  trailing: SizedBox(
                    width: fwidth * 0.07,
                  ),
                ),
              ),
              SizedBox(
                height: fheigth * 0.03,
                width: fwidth,
              ),
              Container(
                width: fwidth * 0.9,
                height: fheigth * 0.14,
                decoration: BoxDecoration(border: Border.all(width: 2.0)),
                child: ListTile(
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Transporter',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: SizedBox(
                    width: fwidth * 0.07,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  subtitle: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing.'),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        child: Transform.scale(
                          scale: 1.25,
                          child: Radio(
                            value: 0,
                            groupValue: _groupValue2,
                            onChanged: (newValue) => setState(() {
                              _groupValue1 = 1;
                              _groupValue2 = 0;
                            }),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: fwidth * 0.01,
                      ),
                      SizedBox(
                          child: Transform.scale(
                              scale: 1.25,
                              child: const Image(
                                  image: AssetImage('assets/img_car.png')))),
                      SizedBox(
                        width: fwidth * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: fheigth * 0.05,
              ),
              SizedBox(
                width: fwidth * 0.9,
                height: fheigth * 0.08,
                child: TextButton(
                  onPressed: () async {},
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
