import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);
  static String id = 'AboutUs_Screen';
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
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            "About us",
                            style: GoogleFonts.inter(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 55,
                        ),
                        Center(
                          child: Text(
                            '''will be the first team that are going to organize such project in Egypt by collaborating with many company of buses to help students and teenagers to find easily their routes to their schools and universities so,busco solve this problem and make a buses with suitable lists of time to the students to help them to book anywhere if their school and universities beside their home or in another town''',
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 230,
                        ),
                        Center(
                          child: Image.asset(
                            'images/Logo.png',
                            height: 120,
                            width: 120,
                          ),
                        )
                      ]),
                ))));
  }
}
