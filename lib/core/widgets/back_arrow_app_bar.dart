import 'package:dating/core/widgets/back_arrow_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackArrowAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackArrowAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50.h,
      automaticallyImplyLeading: true,
      leadingWidth: 70.w,
      leading: const Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: BackArrow(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
