import 'package:dating/core/widgets/button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';

ElevatedButton customButton(Color color, String txt, VoidCallback onPressed,
    {String? imgUrl}) {
  return ElevatedButton(
    style: buttonStyle(color),
    onPressed: onPressed,
    child: SizedBox(
      width: 250.w,
      height: 40.h,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imgUrl != null
                ? Image.asset(
                    imgUrl,
                    height: 30,
                  )
                : const Text(''),
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                txt,
                style: Styles.kH3.copyWith(color: Colors.white),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
