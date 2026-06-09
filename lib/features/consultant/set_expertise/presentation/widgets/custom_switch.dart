import 'package:consultant_customer_app/features/consultant/set_expertise/presentation/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool value)? onChanged;
  const CustomSwitch({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SubtitleText(text: title),
        Transform.scale(
          scale: 0.65,
          child: Switch(
            value: value,
            onChanged: onChanged,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }
}
