import 'package:consultant_customer_app/core/widgets/custom_text_field.dart';
import 'package:consultant_customer_app/features/consultant/set_expertise/presentation/widgets/custom_switch.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions.dart';

class SwitchWithTextField extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool value)? onChanged;
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final String? prefixText;
  final TextStyle? prefixTextStyle;
  const SwitchWithTextField({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.label = 'Set price',
     this.hintText = '00.0',
    required this.controller,
    required this.keyboardType,
    this.prefixIcon,
    this.prefixText,
    this.prefixTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSwitch(title: title, value: value, onChanged: onChanged),

        const SizedBox(height: 8.0),

        CustomTextField(
          label: label,
          hintText: hintText,
          controller: controller,
          prefixText: '\$',
          prefixTextStyle: context.textTheme.labelMedium,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
