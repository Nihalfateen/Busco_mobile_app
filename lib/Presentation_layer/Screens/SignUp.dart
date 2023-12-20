import 'package:busco_app/BloC_layer/sign_up_cubit.dart';
import 'package:busco_app/Presentation_layer/Screens/SignIn.dart';
import 'package:busco_app/Presentation_layer/Widgets/Padding_widget.dart';
import 'package:busco_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'Home_Screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static String id = 'signup_screen';
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  late String email;
  late String password;
  bool _obsrText = true;
  late String username;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is SignUpLoading) {
          showProgressIndicator(context);
        }
        if (state is SignUpSuccess) {
          Navigator.pop(context);
          var firebaseuser = FirebaseAuth.instance.currentUser;
          DocumentReference users = FirebaseFirestore.instance
              .collection("users")
              .doc(firebaseuser!.uid);
          FirebaseAuth auth = FirebaseAuth.instance;
          var result = users.set({
            "UserName": username,
            "userid": FirebaseAuth.instance.currentUser!.uid,
            "UserEmail": email,
            "password": password,
          });
          print('created');
          Navigator.pushNamed(context, HomeScreen.id);
        }
        if (state is SignUpError) {
          // String errorMsg = (state).errorMsg;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Verification failed"),
            backgroundColor: Colors.black,
            duration: const Duration(seconds: 3),
          ));
        }
        if (state is SignUpWeakPassword) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Please use a stronger password'),
            backgroundColor: Colors.black,
            duration: const Duration(seconds: 3),
          ));
        }
        if (state is SignUpUserExist) {
          Navigator.pop(context);
          // String Msg = (state).msg;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("The email already exist"),
            backgroundColor: Colors.black,
            duration: const Duration(seconds: 3),
          ));
        }
      },
      child: Scaffold(
        backgroundColor: background,
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
              child: Form(
                key: _formkey,
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
                    const SizedBox(
                      height: 90,
                    ),
                    Text(
                      'CREATE ACCOUNT',
                      style: GoogleFonts.knewave(color: text, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          username = value;
                        },
                        decoration: Textfielddecoration.copyWith(
                          hintText: 'Username',
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Name';
                          } else if (value.length < 2) {
                            return "Enter Lastname";
                          }
                        },
                        onSaved: (String? value) {
                          username = value!;
                        },
                      ),
                    ),
                    const SizedBox(
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
                        validator:
                            EmailValidator(errorText: "email-already-in-use"),
                        onSaved: (email) => email = email!,
                      ),
                    ),
                    const SizedBox(
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
                        validator: passwordValidator,
                        onSaved: (password) => password = password!,
                      ),
                    ),
                    paddingwidget(
                        title: "Continue",
                        onPressed: () {
                          showProgressIndicator(context);
                          context
                              .read<SignUpCubit>()
                              .registerUser(email: email, password: password);
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account',
                          style: TextStyle(
                              color: hinttxt,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SignIn.id);
                          },
                          child: const Text('SIGN IN',
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w700)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterUserPage extends StatefulWidget {
  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: SignUp(),
    );
  }
}
