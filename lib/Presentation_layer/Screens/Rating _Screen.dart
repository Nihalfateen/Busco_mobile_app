import 'package:busco_app/Presentation_layer/Screens/Thankyou%20_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import '../Widgets/Padding_widget.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({Key? key}) : super(key: key);
  static String id = "Rating_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ThankYou.id);
                        },
                        icon: Icon(
                          Icons.close,
                          color: text,
                          size: 30,
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                        child: Text('RATE THE TRIP',
                            style: GoogleFonts.caveatBrush(
                                color: text,
                                fontSize: 30,
                                fontWeight: FontWeight.bold))),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        height: 60,
                        width: 320,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: border, width: 2)),
                        child: Center(
                          child: RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                        child: Text('YOUR OPINION MATTERS',
                            style: GoogleFonts.rancho(
                                color: text,
                                fontSize: 25,
                                fontWeight: FontWeight.bold))),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(30),
                        height: 250,
                        width: 380,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: text, width: 2),
                            borderRadius: BorderRadius.circular(35)),
                        child: Center(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type Here',
                                hintStyle: TextStyle(color: hinttxt)),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: paddingwidget(
                          title: "SEND",
                          onPressed: () {
                            Navigator.pushNamed(context, ThankYou.id);
                          }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Image.asset(
                        'images/Logo.png',
                        height: 120,
                        width: 120,
                      ),
                    )
                  ]))),
    ));
  }
}
