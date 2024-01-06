part of 'signin_bloc.dart';

sealed class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object> get props => [];
}

final class SignInButtonClicked extends SigninEvent {
  String hrEmail;
  String password;
  SignInButtonClicked({required this.hrEmail, required this.password});
}
