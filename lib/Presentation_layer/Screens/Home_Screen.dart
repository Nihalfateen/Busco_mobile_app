import 'package:busco_app/Presentation_layer/Screens/Trip_details.dart';
import 'package:busco_app/Presentation_layer/Widgets/Times.dart';
import 'package:busco_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets/Padding_widget.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _tripsTime = _gettripsTime();
  }

  int currentIndex = 0;
  List<String> times = ['6:30 AM', '8:00 AM', '12:00 PM', '1:00 PM'];
  List<time>? _tripsTime = <time>[];
  List<time>? _gettripsTime() {
    List<time> tripsTime = <time>[];
    tripsTime.add(time(tripsTime: '6:30 AM'));
    tripsTime.add(time(tripsTime: '8:00 AM'));
    tripsTime.add(time(tripsTime: '12:00 PM'));
    tripsTime.add(time(tripsTime: '1:00 PM'));
  }

  Widget timesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Available Times",
                style: GoogleFonts.caveatBrush(
                    color: text, fontSize: 35, fontWeight: FontWeight.bold))),
        SizedBox(
            height: 80,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: times.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(indent: 5),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: SizedBox(
                      width: 160,
                      child: AnimatedContainer(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: currentIndex == index
                                ? Colors.white70
                                : Colors.white54,
                            borderRadius: currentIndex == index
                                ? BorderRadius.circular(20)
                                : BorderRadius.circular(15),
                            border: currentIndex == index
                                ? Border.all(color: borders, width: 2)
                                : null),
                        duration: const Duration(milliseconds: 300),
                        child: Center(
                          child: Text(
                            times[index],
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  );
                })),
      ],
    );
  }

  Future<void>? _launched;
  final Uri _url = Uri.parse('https://goo.gl/maps/jhAJFTdcn2HyiJPb8');
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
        body: Container(
            height: 1500.h,
            width: 1000.w,
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
                    height: 400,
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
                          const Center(
                            child: Text("Welcome,.....",
                                style: TextStyle(
                                    color: Color(0XFFf8bf53),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Center(
                              child: Text("Book your Bus",
                                  style: GoogleFonts.caveatBrush(
                                      color: text,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold))),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text("FROM",
                                  style: GoogleFonts.knewave(
                                      color: text,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500))),
                          Center(
                            child: SizedBox(
                              width: 250,
                              child: TextFormField(
                                  textAlign: TextAlign.center,
                                  onTap: () => setState(() {
                                        _launched = _launchInBrowser(_url);
                                      }),
                                  decoration: Textfielddecoration.copyWith(
                                      hintText:
                                          'https://goo.gl/maps/jhAJFTdcn2HyiJPb8',
                                      hintStyle: const TextStyle(
                                          color: Colors.black12))),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text("TO",
                                  style: GoogleFonts.knewave(
                                      color: text,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500))),
                          Center(
                            child: SizedBox(
                              width: 250,
                              child: TextFormField(
                                  textAlign: TextAlign.center,
                                  onTap: () => setState(() {
                                        _launched = _launchInBrowser(_url);
                                      }),
                                  decoration: Textfielddecoration.copyWith(
                                      hintText:
                                          'https://goo.gl/maps/jhAJFTdcn2HyiJPb8',
                                      hintStyle: const TextStyle(
                                          color: Colors.black12))),
                            ),
                          ),
                          timesList(),
                          const SizedBox(height: 15),
                          Center(
                              child: paddingwidget(
                                  title: "Search BUS",
                                  onPressed: () {
                                    if (times[currentIndex] == '6:30 AM') {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => TripDetails(
                                                  driverName: 'Amr El Sokary',
                                                  busNumber: '10',
                                                  plateNumber: 'CBC 1334',
                                                  cost: '30 LE')));
                                    } else if (times[currentIndex] ==
                                        '8:00 AM') {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => TripDetails(
                                                  driverName: 'Ahmed',
                                                  busNumber: '12',
                                                  plateNumber: 'CBC 1447',
                                                  cost: '40 LE')));
                                    } else if (times[currentIndex] ==
                                        '12:00 PM') {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => TripDetails(
                                                  driverName: 'Gomaa El Kashef',
                                                  busNumber: '16',
                                                  plateNumber: 'CBC 1344',
                                                  cost: '30 LE')));
                                    } else if (times[currentIndex] ==
                                        '1:00 PM') {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => TripDetails(
                                                  driverName: 'Hameed Zaky',
                                                  busNumber: '20',
                                                  plateNumber: 'CBC 1322',
                                                  cost: '80 LE')));
                                    }
                                  })),
                          const SizedBox(
                            height: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                ])));
  }
}
