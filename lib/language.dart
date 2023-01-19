import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Lang extends StatefulWidget {
  const Lang({super.key});

  @override
  State<Lang> createState() => _LangState();
}

class _LangState extends State<Lang> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var fwidth = constraints.maxWidth;
      var fheigth = constraints.maxHeight;
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: fheigth * 0.067,
                width: fwidth,
              ),
              const SizedBox(
                child: Text(
                  'LIVEEASY',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: fheigth * 0.08,
              ),
              SizedBox(
                child: SvgPicture.asset(
                  'assets/img_info.svg',
                  width: fwidth * 0.12,
                  height: fheigth * 0.12,
                ),
              ),
              SizedBox(
                height: fheigth * 0.05,
              ),
              const SizedBox(
                child: Text(
                  'Please select your Language',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto-Regular'),
                ),
              ),
              SizedBox(
                height: fheigth * 0.02,
              ),
              SizedBox(
                width: fwidth * 0.6,
                child: const Text(
                  'You can change the language at any time',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto-Regular',
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: fheigth * 0.04,
              ),
              SizedBox(
                width: fwidth * 0.7,
                child: DecoratedBox(
                  decoration: const ShapeDecoration(
                    shape: ContinuousRectangleBorder(
                      side: BorderSide(width: 1.0),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: <String>['English']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {},
                      hint: const Padding(
                        padding: EdgeInsets.only(left: 9.0),
                        child: Text('English'),
                      ),
                      isExpanded: true,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: fheigth * 0.04,
              ),
              SizedBox(
                width: fwidth * 0.7,
                height: fheigth * 0.06,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Phone');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF2e3b62),
                    ),
                  ),
                  child: const Text(
                    'NEXT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0),
                  ),
                ),
              ),
              SizedBox(
                height: fheigth * 0.17,
              ),
              SizedBox(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: const [
                    Image(
                      image: AssetImage('assets/light_blue_wave.png'),
                    ),
                    Image(
                      image: AssetImage('assets/dark_blue_wave.png'),
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      );
    });
  }
}
