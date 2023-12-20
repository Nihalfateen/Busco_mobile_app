import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../Data_layer/auth_SignUp_listener.dart';
import '../Data_layer/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState>
    implements AuthRegistrationListener {
  SignUpCubit() : super(SignUpInitial());

  final _authRepository = AuthRepository();
  void registerUser({required String email, required String password}) {
    _authRepository.registerUser(
        email: email, password: password, authRegistrationListener: this);
  }

  @override
  void weakPassword() {
    emit(SignUpInitial());
    emit(SignUpWeakPassword());
  }

  @override
  void failed() {
    emit(SignUpInitial());
    emit(SignUpError());
  }

  @override
  void userExists() {
    emit(SignUpInitial());
    emit(SignUpUserExist());
  }

  @override
  void Success() {
    emit(SignUpSuccess());
  }

  @override
  void Logout() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }
  // @override
  // void userExists(FirebaseAuthException msg) {
  //   print('verificationFailed : ${msg.toString()}');
  //   emit(SignUpUserExist(msg: msg.toString()));
  // }
}
