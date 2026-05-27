import 'package:consultant_customer_app/config/theme/app_spacing.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class AuthMethod extends StatelessWidget {
  final String image;
  final String title;
  final void Function() onTap;
  final Color? color;
  final Alignment? alignment;
  const AuthMethod({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
    this.alignment, this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: alignment,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
        width: double.infinity,
        height: AppSpacing.s44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.s4),
          color: color ?? Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image, width: AppSpacing.s24),
            const SizedBox(width: AppSpacing.s16),
            Text(title, style: context.textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
