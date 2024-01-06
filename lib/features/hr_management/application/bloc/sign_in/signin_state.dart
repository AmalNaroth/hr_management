part of 'signin_bloc.dart';

sealed class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

final class SigninInitial extends SigninState {}

final class LoadingState extends SigninState {}

final class ErrorState extends SigninState {
  String message;
  ErrorState({required this.message});
}

final class SuccessState extends SigninState {
  String message;
  SuccessState({required this.message});
}
