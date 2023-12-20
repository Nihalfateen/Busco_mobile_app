import 'package:busco_app/Presentation_layer/Screens/Confirmed.dart';
import 'package:busco_app/Presentation_layer/Screens/Credit_card.dart';
import 'package:busco_app/Presentation_layer/Screens/E-wallet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static String id = 'payment_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                          child: Text('PAYMENT METHOD',
                              style: GoogleFonts.caveatBrush(
                                  color: text,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Confirmed.id);
                        },
                        child: Image.asset('images/Cash.png'),
                      )),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, WalletScreen.id);
                        },
                        child: Image.asset('images/wallet.png'),
                      )),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CreditCard.id);
                        },
                        child: Image.asset('images/card.png'),
                      )),
                    ]))));
  }
}
