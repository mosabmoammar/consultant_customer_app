import 'package:consultant_customer_app/config/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class IconButtonBackArrow extends StatelessWidget {
  final Color? color;
  const IconButtonBackArrow({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: color ?? Colors.black,
        size: AppSpacing.s32,
      ),
    );
  }
}
