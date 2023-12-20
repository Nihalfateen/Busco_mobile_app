import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../constants.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);
  static String id = "Wallet_screen";
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
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: text,
                          size: 30,
                        )),
                    const SizedBox(height: 40),
                    Center(
                        child: Text('E-WALLET',
                            style: GoogleFonts.caveatBrush(
                              color: text,
                              fontSize: 37,
                            ))),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(30),
                        height: 250,
                        width: 360,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: hinttxt, width: 3),
                            borderRadius: BorderRadius.circular(35)),
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.all(30),
                            height: 250,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: hinttxt, width: 2),
                            ),
                            child: QrImage(
                              data:
                                  'https://5linesinformation.files.wordpress.com/2017/10/wp-1509070209334.jpg',
                              version: QrVersions.auto,
                              size: 320,
                              gapless: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: Text('SCAN YOUR CODE',
                            style: GoogleFonts.caveatBrush(
                                color: const Color(0XFFf5c213),
                                fontSize: 40,
                                fontWeight: FontWeight.bold))),
                    Center(
                        child: Text('TO PAY ',
                            style: GoogleFonts.caveatBrush(
                                color: const Color(0XFFf5c213),
                                fontSize: 40,
                                fontWeight: FontWeight.bold))),
                    const SizedBox(
                      height: 80,
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
