import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/assets_manager/svg_assets.dart';
import '../utils/extensions.dart';

class WalletWidget extends StatelessWidget {
  final double amount;
  const WalletWidget({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Row(
        children: [
          SvgPicture.asset(SvgAssets.wallet),
          const SizedBox(width: 4.0),
          Text(
            '$amount',
            style: context.textTheme.displayMedium?.copyWith(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
