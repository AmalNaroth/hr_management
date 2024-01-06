import 'package:hr_management_new/core/resources/data_state.dart';

abstract class SignInServices {
  Future<DataState> signInMethod(
      {required String email,
      required String password,});
}
