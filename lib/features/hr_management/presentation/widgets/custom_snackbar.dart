import 'package:flutter/material.dart';

void customSnackBar(String textValue, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(textValue),
    ),
  );
}
