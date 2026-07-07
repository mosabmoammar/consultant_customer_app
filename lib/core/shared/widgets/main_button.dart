import 'package:consultant_customer_app/config/theme/app_spacing.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  const MainButton({
    super.key,
    required this.onPressed,
    this.title = 'Continue',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSpacing.s44,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: context.textTheme.labelLarge?.copyWith(
            fontSize: 16.0,
            color: context.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
