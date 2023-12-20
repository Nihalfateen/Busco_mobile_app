import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

Color background = const Color(0xFFf0eeef);
Color text = const Color(0XFF676565);
Color borders = const Color(0XFFd5bead);
Color hinttxt = const Color(0XFFd9d9d9);
Color border = const Color(0XFFe5ca9f);

const Textfielddecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(color: Colors.black12, fontWeight: FontWeight.bold),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0XFFd5bead), width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0XFFd5bead), width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
const emailError = 'email-already-in-use';
const requiredField = "This field is required";
final passwordValidator = MultiValidator(
  [
    RequiredValidator(errorText: 'email-already-in-use'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  ],
);
void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = const AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    ),
  );
  showDialog(
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(0),
      context: context,
      builder: (context) {
        return alertDialog;
      });
}
