import 'package:consultant_customer_app/config/theme/app_spacing.dart';
import 'package:consultant_customer_app/core/constants/assets_manager/image_assets.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class InterestItem extends StatelessWidget {
  final String imageAsset;
  final String text;
  const InterestItem({super.key, required this.imageAsset, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imageAsset, fit: BoxFit.cover),

        const SizedBox(height: AppSpacing.s10),

        Text(
          text,
          style: context.textTheme.labelMedium?.copyWith(
            height: 1.00,
            letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }
}
