import 'package:busco_app/Presentation_layer/Screens/Rating%20_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Confirmed extends StatelessWidget {
  const Confirmed({Key? key}) : super(key: key);
  static String id = 'Confirmed_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RatingScreen.id);
        },
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    '''THE TRIP IS''',
                    style: GoogleFonts.knewave(
                        color: Color(0XFFf5c213), fontSize: 40),
                  ),
                ),
                Center(
                  child: Text(
                    '''SUCCESSFULLY''',
                    style: GoogleFonts.knewave(
                        color: Color(0XFFf5c213), fontSize: 40),
                  ),
                ),
                Center(
                  child: Text(
                    '''CONFIRMED''',
                    style: GoogleFonts.knewave(
                        color: Color(0XFFf5c213), fontSize: 40),
                  ),
                ),
                Center(
                  child: Text(
                    '''ENJOY YOUR TRIP''',
                    style: GoogleFonts.knewave(
                        color: Color(0XFFf5c213), fontSize: 40),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Image.asset(
                  'images/Logo.png',
                  height: 150,
                  width: 150,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
