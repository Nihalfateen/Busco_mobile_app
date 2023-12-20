import 'package:busco_app/Presentation_layer/Screens/Confirmed.dart';
import 'package:busco_app/Presentation_layer/Screens/Payment_Screen.dart';
import 'package:busco_app/Presentation_layer/Screens/Share_Screen.dart';
import 'package:flutter/material.dart';
import 'package:busco_app/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/Padding_widget.dart';

class TripDetails extends StatefulWidget {
  String driverName;
  String busNumber;
  String plateNumber;
  String cost;
  TripDetails(
      {required this.driverName,
      required this.busNumber,
      required this.plateNumber,
      required this.cost});
  static String id = 'trip_details';
  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  // String? driverName;
  // String? busNumber;
  // String? plateNumber;
  // String? cost;
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: text,
                      size: 30,
                    )),
                Center(
                    child: Text('TRiP DETAiLS',
                        style: GoogleFonts.caveatBrush(
                            color: text,
                            fontSize: 35,
                            fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 560,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        border: Border.all(color: text, width: 2)),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(children: [
                                Image.asset('images/Driver name.png'),
                                SizedBox(width: 10),
                                Text(
                                  "Driver name",
                                  style: TextStyle(
                                      color: text,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ]),
                              Center(
                                child: SizedBox(
                                  width: 150,
                                  height: 40,
                                  child: TextFormField(
                                      textAlign: TextAlign.center,
                                      decoration: Textfielddecoration.copyWith(
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        hintText: "${widget.driverName}",
                                      )),
                                ),
                              ),
                              Row(children: [
                                Image.asset('images/Bus number.png'),
                                SizedBox(width: 10),
                                Text(
                                  "Bus number",
                                  style: TextStyle(
                                      color: text,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ]),
                              Center(
                                child: SizedBox(
                                  width: 150,
                                  height: 40,
                                  child: TextFormField(
                                      textAlign: TextAlign.center,
                                      decoration: Textfielddecoration.copyWith(
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          hintText: "${widget.busNumber}")),
                                ),
                              ),
                              Row(children: [
                                Image.asset('images/plate number.png'),
                                SizedBox(width: 10),
                                Text(
                                  "Bus plate number",
                                  style: TextStyle(
                                      color: text,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ]),
                              Center(
                                child: SizedBox(
                                  width: 150,
                                  height: 40,
                                  child: TextFormField(
                                      textAlign: TextAlign.center,
                                      decoration: Textfielddecoration.copyWith(
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          hintText: "${widget.plateNumber}")),
                                ),
                              ),
                              Row(children: [
                                Image.asset('images/rating.png'),
                                SizedBox(width: 10),
                                Text(
                                  "Rating",
                                  style: TextStyle(
                                      color: text,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ]),
                              Center(
                                child: Container(
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Color(0XFFd5bead),
                                        width: 3,
                                      )),
                                  child: Center(
                                    child: RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 3,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
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
                              Row(children: [
                                Image.asset('images/cost.png'),
                                SizedBox(width: 10),
                                Text(
                                  "Trip cost",
                                  style: TextStyle(
                                      color: text,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ]),
                              Center(
                                child: SizedBox(
                                  width: 150,
                                  height: 40,
                                  child: TextFormField(
                                      textAlign: TextAlign.center,
                                      decoration: Textfielddecoration.copyWith(
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          hintText: "${widget.cost}")),
                                ),
                              ),
                            ])),
                  ),
                ),
                Center(
                  child: paddingwidget(
                      title: "CONFIRM",
                      onPressed: () {
                        Navigator.pushNamed(context, PaymentScreen.id);
                      }),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ShareScreen.id);
                    },
                    child: Text('Share trip with'),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  indent: 138,
                  endIndent: 138,
                  color: Color(0XFF676565),
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
