import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management_new/core/util/navigator_service/navigator_services.dart';
import 'package:hr_management_new/config/routes/app_routes.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/sign_in/signin_bloc.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_snackbar.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

final _formKey = GlobalKey<FormState>();

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/tsai-sen-yu-Axzl2n5htMM-unsplash.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      fHight70,
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "N A R O ",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: "T E C H",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      fHight20,
                      RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                            text: "L",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: "ogin ",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "I",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: "n ",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "N",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: "ow",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ]),
                      ),
                      fHight20,
                      CustomTextWidget01(
                        textValue: "Please login to continue using our app",
                        fontWeight: FontWeight.w600,
                        fontColors: const Color.fromARGB(255, 187, 187, 187),
                      ),
                      fHight10,
                      TextFormField(
                        controller: _emailController,
                        validator: emailValidator,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      fHight10,
                      TextFormField(
                        controller: _passwordController,
                        validator: passwordVAlidator,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      fHight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: CustomTextWidget01(
                              textValue: "Forgot password?",
                              fontColors: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      fHight30,
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SigninBloc>().add(
                                  SignInButtonClicked(
                                    hrEmail: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  ),
                                );
                          }
                        },
                        child: BlocConsumer<SigninBloc, SigninState>(
                          listener: (context, state) {
                            if (state is SuccessState) {
                              customSnackBar(state.message, context);
                              NavigatorService.pushNamedAndRemoveUntil(
                                  AppRoutes.homeScreen);
                                  _emailController.clear();
                                  _passwordController.clear();
                            } else if (state is ErrorState) {
                              customSnackBar(state.message, context);
                            }
                          },
                          builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (state is LoadingState)
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  else
                                    CustomTextWidget01(
                                      textValue: "SIGN IN",
                                      fontColors: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      fHight10,
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 2,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: CustomTextWidget01(
                              textValue: "OR",
                              fontColors: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 2,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Enter the email";
  } else if (!value.contains("@gmail.com")) {
    return "Enter the correct email";
  }
  return null;
}

String? passwordVAlidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Enter the password";
  } else if (value.length < 7) {
    return "The password should be at least 7 characters long";
  }
  return null;
}
