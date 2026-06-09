import 'package:consultant_customer_app/config/theme/app_spacing.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:consultant_customer_app/core/widgets/main_button.dart';
import 'package:consultant_customer_app/core/widgets/text_title.dart';
import 'package:consultant_customer_app/features/consultant/set_expertise/presentation/widgets/category_widget.dart';
import 'package:consultant_customer_app/features/consultant/set_expertise/presentation/widgets/custom_checkbox.dart';
import 'package:consultant_customer_app/features/consultant/set_expertise/presentation/widgets/custom_switch.dart';
import 'package:consultant_customer_app/features/consultant/set_expertise/presentation/widgets/custom_text_field_widget.dart';
import 'package:consultant_customer_app/features/consultant/set_expertise/presentation/widgets/subtitle_text.dart';
import 'package:consultant_customer_app/features/consultant/set_expertise/presentation/widgets/switch_with_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../core/widgets/icon_button_back_arrow.dart';
import '../widgets/day_row.dart';

class SetExpertiseScreen extends StatefulWidget {
  const SetExpertiseScreen({super.key});

  @override
  State<SetExpertiseScreen> createState() => _SetExpertiseScreenState();
}

class _SetExpertiseScreenState extends State<SetExpertiseScreen> {
  bool switchScheduleValue = true;
  bool switchAudioCallValue = true;
  bool switchVideoCallValue = true;
  bool switchChatValue = true;
  bool switchFreeValue = true;
  bool cbValue = true;
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];
  final TextEditingController _audioCallPriceController = TextEditingController(
    text: '10.0',
  );
  final TextEditingController _videoCallPriceController = TextEditingController(
    text: '10.0',
  );
  final TextEditingController _chatPriceController = TextEditingController(
    text: '10.0',
  );

  @override
  void dispose() {
    _chatPriceController.dispose();
    _audioCallPriceController.dispose();
    _videoCallPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const IconButtonBackArrow(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: .onDrag,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.s16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextTitle(text: 'Set your exprtise'),

                const SizedBox(height: AppSpacing.s24),

                const CategoryWidget(),

                const SizedBox(height: AppSpacing.s24),

                const CustomTextFieldWidget(
                  label: 'Introduction video',
                  hintText: 'Paste YouTube link here',
                ),

                const SizedBox(height: AppSpacing.s24),

                const SubtitleText(text: 'Identity Proof'),

                const SizedBox(height: AppSpacing.s16),

                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSpacing.s4),
                      color: AppColors.lightGray2,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.upload_file_outlined,
                          color: context.colorScheme.secondary,
                          size: 20.0,
                        ),
                        Text(
                          'Upload Document',
                          style: context.textTheme.displayMedium?.copyWith(
                            color: AppColors.darkGray2,
                            height: 1.00,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.s24),

                // Schedule sec
                Column(
                  children: [
                    CustomSwitch(
                      title: 'Schedule',
                      value: switchScheduleValue,
                      onChanged: (value) {
                        setState(() {
                          switchScheduleValue = value;
                        });
                      },
                    ),

                    const SizedBox(height: AppSpacing.s16),

                    ...days.map((day) => DayRow(dayName: day)),

                    const SizedBox(height: 24.0),

                    // Audio Call (per min)
                    SwitchWithTextField(
                      title: 'Audio Call (per min)',
                      value: switchAudioCallValue,
                      onChanged: (value) {
                        setState(() {
                          switchAudioCallValue = value;
                        });
                      },
                      controller: _audioCallPriceController,
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 24.0),

                    // Video Call (per min)
                    SwitchWithTextField(
                      title: 'Video Call (per min)',
                      value: switchVideoCallValue,
                      onChanged: (value) {
                        setState(() {
                          switchVideoCallValue = value;
                        });
                      },
                      controller: _videoCallPriceController,
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 24.0),

                    // Chat (per session)
                    SwitchWithTextField(
                      title: 'Chat (per session)',
                      value: switchChatValue,
                      onChanged: (value) {
                        setState(() {
                          switchChatValue = value;
                        });
                      },
                      controller: _chatPriceController,
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 8.0),

                    CustomCheckbox(
                      text: 'Mark as free',
                      value: switchFreeValue,
                      onChanged: (value) {
                        setState(() {
                          switchFreeValue = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 64.0),

                    MainButton(onPressed: () {}, title: 'Finish'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
