import 'package:busco_app/BloC_layer/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import '../Widgets/Padding_widget.dart';
import 'Home_Screen.dart';

class SignIn extends StatefulWidget {
  static String id = 'sign_in';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late String email;
  late String password;
  bool _obsrText = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
        listenWhen: (previous, current) {
          return previous != current;
        },
        listener: (context, state) {
          if (state is SignInLoading) {
            showProgressIndicator(context);
          }
          if (state is SignInSuccess) {
            Navigator.pop(context);
            Navigator.pushNamed(context, HomeScreen.id);
          }
          if (state is SignInUserNotFound) {
            // String errorMsg = (state).errorMsg;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("User Not Found"),
              backgroundColor: Colors.black,
              duration: const Duration(seconds: 3),
            ));
          }
          if (state is SignInPasswordWrong) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('password is wrong'),
              backgroundColor: Colors.black,
              duration: const Duration(seconds: 3),
            ));
          }
        },
        child: Scaffold(
          backgroundColor: background,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      'images/Logo.png',
                      height: 150,
                      width: 150,
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    'SiGN iN',
                    style: GoogleFonts.knewave(color: text, fontSize: 25),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: Textfielddecoration.copyWith(
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      obscureText: _obsrText,
                      keyboardType: TextInputType.text,
                      obscuringCharacter: '*',
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: Textfielddecoration.copyWith(
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obsrText = !_obsrText;
                            });
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(
                            _obsrText == false
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0XFF676565),
                          ),
                        ),
                      ),
                    ),
                  ),
                  paddingwidget(
                      title: "Continue",
                      onPressed: () {
                        showProgressIndicator(context);
                        context
                            .read<SignInCubit>()
                            .signInUser(email: email, password: password);
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
