import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ThankYou extends StatelessWidget {
  static String id = 'ThankYou_screen';
  const ThankYou({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () {},
            child: Container(
                height: 1500,
                width: 1000,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/grey.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 280,
                      ),
                      Center(
                        child: Text(
                          '''THANK YOU''',
                          style: GoogleFonts.caveatBrush(
                              color: const Color(0XFFf5c213),
                              fontSize: 55,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Center(
                        child: Image.asset(
                          'images/Logo.png',
                          height: 120,
                          width: 120,
                        ),
                      )
                    ]))));
  }
}
