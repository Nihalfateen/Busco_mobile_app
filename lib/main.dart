import 'package:busco_app/Presentation_layer/Screens/Confirmed.dart';
import 'package:busco_app/Presentation_layer/Screens/Credit_card.dart';
import 'package:busco_app/Presentation_layer/Screens/E-wallet.dart';
import 'package:busco_app/Presentation_layer/Screens/Home_Screen.dart';
import 'package:busco_app/Presentation_layer/Screens/Payment_Screen.dart';
import 'package:busco_app/Presentation_layer/Screens/Rating%20_Screen.dart';
import 'package:busco_app/Presentation_layer/Screens/Share_Screen.dart';
import 'package:busco_app/Presentation_layer/Screens/SignIn.dart';
import 'package:busco_app/Presentation_layer/Screens/SignUp.dart';
import 'package:busco_app/Presentation_layer/Screens/Splash_screen.dart';
import 'package:busco_app/Presentation_layer/Screens/Thankyou%20_Screen.dart';
import 'package:busco_app/Presentation_layer/Screens/Trip_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'config.dart';
import 'BloC_layer/sign_in_cubit.dart';
import 'BloC_layer/sign_up_cubit.dart';

late String initialRoute;
final configurations = Configurations();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: configurations.apiKey,
          appId: configurations.appId,
          projectId: configurations.projectId,
          messagingSenderId: ''));
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      initialRoute = SignUp.id;
    } else {
      initialRoute = HomeScreen.id;
    }
  });
  runApp(BuscoApp());
}

class BuscoApp extends StatelessWidget {
  late SignUpCubit signupcubit;
  late SignInCubit signInCubit;

  BuscoApp() {
    signupcubit = SignUpCubit();
    signInCubit = SignInCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          initialRoute: SplashScreen.id,
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            SignUp.id: (context) => BlocProvider(
                  create: (BuildContext context) => SignUpCubit(),
                  child: const SignUp(),
                ),
            SignIn.id: (context) => BlocProvider(
                  create: (BuildContext context) => SignInCubit(),
                  child: SignIn(),
                ),
            HomeScreen.id: (context) => HomeScreen(),
            TripDetails.id: (context) => TripDetails(
                  driverName: '',
                  plateNumber: '',
                  busNumber: '',
                  cost: '',
                ),
            Confirmed.id: (context) => const Confirmed(),
            PaymentScreen.id: (context) => const PaymentScreen(),
            CreditCard.id: (context) => CreditCard(),
            RatingScreen.id: (context) => const RatingScreen(),
            ThankYou.id: (context) => const ThankYou(),
            WalletScreen.id: (context) => const WalletScreen(),
            ShareScreen.id: (context) => ShareScreen(),
          },
        );
      },
    );
  }
}
