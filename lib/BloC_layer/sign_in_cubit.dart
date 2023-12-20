import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../Data_layer/auth_SignIn_listener.dart';
import '../Data_layer/auth_repo.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> implements AuthSigninListener {
  SignInCubit() : super(SignInInitial());
  final _authRepository = AuthRepository();
  void signInUser({required String email, required String password}) {
    _authRepository.signInUser(
        email: email, password: password, authSigninListener: this);
  }

  @override
  void success() {
    emit(SignInSuccess());
  }

  @override
  void userNotFound() {
    emit(SignInUserNotFound());
  }

  @override
  void passwordWrong() {
    emit(SignInPasswordWrong());
  }
}
