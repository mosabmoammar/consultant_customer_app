import 'package:consultant_customer_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String text;
  final bool value;
  final void Function(bool? value)? onChanged;
  const CustomCheckbox({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.value,
          onChanged: widget.onChanged,
          side: BorderSide(width: 1.0),
          activeColor: AppColors.cbActiveColor,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
        ),
        const SizedBox(width: 6.0),
        Text(widget.text),
      ],
    );
  }
}
