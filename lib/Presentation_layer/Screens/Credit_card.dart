import 'package:busco_app/Presentation_layer/Screens/Confirmed.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../Widgets/Padding_widget.dart';

class CreditCard extends StatelessWidget {
  static String id = 'creditcard_screen';
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
                    SizedBox(
                      height: 80,
                    ),
                    Center(
                        child: Text('CREDIT CARD',
                            style: GoogleFonts.caveatBrush(
                                color: text,
                                fontSize: 35,
                                fontWeight: FontWeight.bold))),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(30),
                        height: 250,
                        width: 380,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: text, width: 2),
                            borderRadius: BorderRadius.circular(35)),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "VISA NUMBER",
                                style: TextStyle(
                                    color: text,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 200,
                                child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: Textfielddecoration.copyWith(
                                        hintText: "**********",
                                        hintStyle: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w700,
                                            color: hinttxt))),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "PIN CODE",
                                style: TextStyle(
                                  color: text,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: Textfielddecoration.copyWith(
                                        hintText: "**********",
                                        hintStyle: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w700,
                                            color: hinttxt))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: paddingwidget(
                          title: "CONFIRM",
                          onPressed: () {
                            Navigator.pushNamed(context, Confirmed.id);
                          }),
                    ),
                    SizedBox(height: 60),
                    Center(
                      child: Image.asset(
                        'images/Logo.png',
                        height: 100,
                        width: 100,
                      ),
                    )
                  ]))),
    ));
  }
}
