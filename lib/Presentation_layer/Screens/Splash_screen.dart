import 'package:busco_app/Presentation_layer/Screens/SignUp.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String id = "Splash_Screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushNamed(context, SignUp.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
