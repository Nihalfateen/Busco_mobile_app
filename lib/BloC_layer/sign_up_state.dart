part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpError extends SignUpState {
  // final String errorMsg;
  // SignUpError({required this.errorMsg});
}

class SignUpSuccess extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpUserExist extends SignUpState {
  // final String msg;
  // SignUpUserExist({required this.msg});
}

class SignUpWeakPassword extends SignUpState {}
