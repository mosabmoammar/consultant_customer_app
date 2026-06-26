import 'package:consultant_customer_app/config/theme/app_colors.dart';
import 'package:consultant_customer_app/features/consultant/set_expertise/presentation/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions.dart';

class DayRow extends StatefulWidget {
  final String dayName;
  const DayRow({super.key, required this.dayName});

  @override
  State<DayRow> createState() => _DayRowState();
}

class _DayRowState extends State<DayRow> {
  bool isChecked = false;
  List<int> timeSlots = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 90.0,
              height: 44.0,
              child: Center(
                child: CustomCheckbox(
                  text: widget.dayName,
                  value: isChecked,
                  onChanged: (value) => setState(() => isChecked = value!),
                ),
              ),
            ),
            Expanded(
              child: timeSlots.isEmpty
                  ? GestureDetector(
                      onTap: () => setState(
                        () => timeSlots.add(
                          DateTime.now().millisecondsSinceEpoch,
                        ),
                      ),
                      child: Container(
                        height: 44.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.lightGray2,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "Add time",
                          style: context.textTheme.labelSmall?.copyWith(
                            color: AppColors.onTextFieldColor,
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: timeSlots
                          .map(
                            (id) => TimeSlotRow(
                              isEnabled: isChecked,
                              onDelete: () =>
                                  setState(() => timeSlots.remove(id)),
                              onAdd: () => setState(
                                () => timeSlots.add(
                                  DateTime.now().millisecondsSinceEpoch,
                                ),
                              ),
                              isFirst: id == timeSlots.first,
                            ),
                          )
                          .toList(),
                    ),
            ),
          ],
        ),
        Divider(color: Colors.grey[100]),
      ],
    );
  }
}

class TimeSlotRow extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onAdd;
  final bool isFirst;
  final bool isEnabled;
  const TimeSlotRow({
    super.key,
    required this.onDelete,
    required this.onAdd,
    required this.isFirst,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: TimeField(enabled: isEnabled)),
        const SizedBox(width: 8.0),
        Expanded(child: TimeField(enabled: isEnabled)),
        IconButton(
          icon: Icon(
            isFirst ? Icons.add_circle_outline : Icons.remove_circle_outline,
            color: isEnabled ? Colors.black : Colors.grey,
            size: 16.0,
          ),
          onPressed: isEnabled ? (isFirst ? onAdd : onDelete) : null,
        ),
      ],
    );
  }
}

class TimeField extends StatefulWidget {
  final bool enabled;
  final void Function()? onTap;
  const TimeField({super.key, required this.enabled, this.onTap});

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {
  TimeOfDay _selectedTime = const TimeOfDay(hour: 10, minute: 00);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectTime(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        height: 44.0,
        decoration: BoxDecoration(
          color: widget.enabled ? AppColors.lightGray2 : Colors.grey[100],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              _selectedTime.format(context),
              style: context.textTheme.labelSmall?.copyWith(
                color: widget.enabled ? Colors.black : Colors.grey,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: widget.enabled ? Colors.black : Colors.grey,
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }
}
