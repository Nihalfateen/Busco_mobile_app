import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class paddingwidget extends StatelessWidget {
  paddingwidget({required this.title, required this.onPressed});
  Color c = const Color(0XFFd5bead);
  Color co = const Color(0xFFf9c562);
  Color text = const Color(0XFF676565);
  final String title;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: co,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.orange, width: 2)),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: GoogleFonts.knewave(
                color: text, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
