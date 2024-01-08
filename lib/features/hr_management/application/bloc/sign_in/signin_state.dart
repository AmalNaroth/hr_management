part of 'signin_bloc.dart';

sealed class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

final class SigninInitial extends SigninState {}

final class SigninLoadingState extends SigninState {}

final class SigninErrorState extends SigninState {
  String message;
  SigninErrorState({required this.message});
}

final class SigninSuccessState extends SigninState {
  String message;
  SigninSuccessState({required this.message});
}
