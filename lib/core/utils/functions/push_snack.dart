import 'package:flutter/material.dart';

pushSnackBar(BuildContext context, String? message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message!),
      duration: const Duration(seconds: 2),
    ),
  );
}
