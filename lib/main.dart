import 'package:liveasyapp/language.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:liveasyapp/otp_screen.dart';
import 'package:liveasyapp/phone.dart';
import 'package:liveasyapp/profile.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AuthApp',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Lang(),
        '/Phone': (context) => const Phone(),
        '/OtpScreen': (context) => const OtpScreen(),
        '/Profile': (context) => const ProfilePage(),
      },
    );
  }
}
