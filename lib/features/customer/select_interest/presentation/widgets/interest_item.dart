import 'package:consultant_customer_app/config/theme/app_spacing.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class InterestItem extends StatelessWidget {
  final String imageAsset;
  final String text;
  final void Function()? onTap;
  final bool isSelected;
  const InterestItem({
    super.key,
    required this.imageAsset,
    required this.text,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSpacing.s8),
                border: isSelected
                    ? Border.all(
                        width: AppSpacing.s4,
                        color: context.colorScheme.secondary,
                      )
                    : null,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSpacing.s8),
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.s10),

          Text(
            text,
            style: isSelected
                ? context.textTheme.titleLarge?.copyWith(
                    color: context.colorScheme.secondary,
                  )
                : context.textTheme.labelMedium?.copyWith(
                    height: 1.00,
                    letterSpacing: -0.2,
                  ),
          ),
        ],
      ),
    );
  }
}
