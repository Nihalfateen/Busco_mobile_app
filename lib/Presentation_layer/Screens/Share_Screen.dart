import 'package:busco_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareScreen extends StatefulWidget {
  static String id = 'share_screen';

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  Future<void>? _launched;

  final Uri _url = Uri.parse(
      'https://5linesinformation.files.wordpress.com/2017/10/wp-1509070209334.jpg');

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: text,
            size: 30,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
            height: 1500,
            width: 1000,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/maps.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                          image: const DecorationImage(
                            image: AssetImage('images/grey.png'),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                              color: const Color(0XFF6a757c), width: 3)),
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                            const Divider(
                              thickness: 4,
                              indent: 165,
                              endIndent: 165,
                              color: Color(0XFF676565),
                              height: 30,
                            ),
                            const SizedBox(height: 15),
                            Center(
                                child: Text("SHARE TRIP",
                                    style: GoogleFonts.caveatBrush(
                                        color: text,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold))),
                            const SizedBox(height: 15),
                            const Padding(
                              padding: EdgeInsets.only(right: 25, left: 60),
                              child: Text("COPY LINK",
                                  style: TextStyle(
                                    color: Color(0XFFf5c213),
                                    fontSize: 20,
                                  )),
                            ),
                            Center(
                              child: SizedBox(
                                width: 350,
                                height: 50,
                                child: TextFormField(
                                    onTap: () => setState(() {
                                          _launched = _launchInBrowser(_url);
                                        }),
                                    textAlign: TextAlign.center,
                                    decoration: Textfielddecoration.copyWith(
                                      hintText:
                                          'https://BUSCOTRIP/TRACKING.aspx?action=editnew&resid=6AF0281261E1',
                                      hintStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Image.asset(
                                'images/Logo.png',
                                height: 120,
                                width: 120,
                              ),
                            ),
                          ])))
                ])));
  }
}
