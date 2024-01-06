import 'package:flutter/material.dart';

class PasswordTextformField extends StatefulWidget {
  TextEditingController passwordController;
  String fieldName;
  Key keyvalue;
  PasswordTextformField(
      {super.key, required this.passwordController, required this.fieldName,
      required this.keyvalue});

  @override
  State<PasswordTextformField> createState() => _PasswordTextformFieldState();
}

class _PasswordTextformFieldState extends State<PasswordTextformField> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.keyvalue,
      obscureText: flag,
      controller: widget.passwordController,
      //validator: passwordVAlidator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: widget.fieldName,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              flag = !flag;
            });
          },
          icon: flag
              ? const Icon(
                  Icons.visibility_off,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.visibility,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
