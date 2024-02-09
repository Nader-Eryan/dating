import 'package:flutter/material.dart';

import '../../constants.dart';

ButtonStyle buttonStyle(Color color) {
  return ButtonStyle(
    side: MaterialStateProperty.all(BorderSide(color: color)),
    backgroundColor: MaterialStateProperty.all(color),
    minimumSize: MaterialStateProperty.all(const Size(260, 56)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius)),
    ),
  );
}
