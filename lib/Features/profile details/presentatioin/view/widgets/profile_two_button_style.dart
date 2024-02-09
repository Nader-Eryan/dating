import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

ElevatedButton profileThreeButton(Color txtColor, String txt,
    VoidCallback onPressed, Color borderColor, Color groundColor,
    {Icon? icon, String pressed = ''}) {
  return ElevatedButton(
    style: ButtonStyle(
      side: MaterialStateProperty.all(BorderSide(color: borderColor)),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return kPrimaryClr;
          } else if (pressed == txt) {
            return kPrimaryClr;
          } else {
            return groundColor;
          } // Use the component's default.
        },
      ),
      minimumSize: MaterialStateProperty.all(const Size(260, 56)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius)),
      ),
    ),
    onPressed: onPressed,
    child: SizedBox(
      width: 250.w,
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.contain,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                txt,
                style: Styles.kH3
                    .copyWith(color: pressed == txt ? Colors.white : txtColor),
                maxLines: 1,
              ),
            ),
          ),
          pressed == txt
              ? const Icon(
                  Icons.done,
                  color: Colors.white,
                )
              : const Text('')
        ],
      ),
    ),
  );
}
