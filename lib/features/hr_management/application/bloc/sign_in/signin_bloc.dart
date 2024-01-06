import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hr_management_new/core/resources/data_state.dart';
import 'package:hr_management_new/features/hr_management/domain/sign_in/sign_in_services.dart';
import 'package:injectable/injectable.dart';

part 'signin_event.dart';
part 'signin_state.dart';

@injectable
class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc(SignInServices signInInstance) : super(SigninInitial()) {
    on<SignInButtonClicked>(
      (event, emit) async {
        emit(
          LoadingState(),
        );
        final result = await signInInstance.signInMethod(
            email: event.hrEmail, password: event.password);

        if (result is DataSuccess) {
          emit(
            SuccessState(message: result.data.toString(),),
          );
        } else {
          emit(
            ErrorState(message: result.error.toString(),),
          );
        }
      },
    );
  }
}
