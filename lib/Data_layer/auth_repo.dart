import 'package:firebase_auth/firebase_auth.dart';
import 'auth_SignIn_listener.dart';
import 'auth_SignUp_listener.dart';

class AuthRepository {
  void registerUser(
      {required String email,
      required String password,
      required AuthRegistrationListener authRegistrationListener}) async {
    var authInstance = FirebaseAuth.instance;
    var msg = FirebaseAuthException;
    try {
      UserCredential userCredential = await authInstance
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user!.sendEmailVerification();
      authRegistrationListener.Success();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        authRegistrationListener.weakPassword();
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.:');
        authRegistrationListener.userExists();
      }
    } catch (e) {
      print(e);
      authRegistrationListener.failed();
    }
  }

  void signInUser(
      {required String email,
      required String password,
      required AuthSigninListener authSigninListener}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      authSigninListener.success();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('User Not Found');
        authSigninListener.userNotFound();
      } else if (e.code == 'wrong-password') {
        print('The password provided is Wrong');
        authSigninListener.passwordWrong();
      }
    }
  }
}
