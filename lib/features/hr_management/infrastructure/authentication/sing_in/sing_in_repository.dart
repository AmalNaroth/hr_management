import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr_management_new/core/resources/data_state.dart';
import 'package:hr_management_new/features/hr_management/domain/sign_in/sign_in_services.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: SignInServices)
class SignInRepository implements SignInServices {
  @override
  Future<DataState> signInMethod(
      {required String email,
      required String password,}) async {
    try {
      UserCredential _userCread = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
     return DataSuccess("Sign in success");
    } catch (e) {
      return DataFailed(e as FirebaseException);
    }
  }
}
