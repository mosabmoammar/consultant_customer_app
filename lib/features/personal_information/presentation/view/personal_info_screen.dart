import 'package:consultant_customer_app/config/theme/app_colors.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:consultant_customer_app/core/widgets/custom_text_form_field.dart';
import 'package:consultant_customer_app/core/widgets/main_button.dart';
import 'package:consultant_customer_app/core/widgets/text_title.dart';
import 'package:consultant_customer_app/features/personal_information/presentation/widgets/phone_input_form_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/app_spacing.dart';
import '../../../../core/widgets/icon_button_back_arrow.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const IconButtonBackArrow(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.s16),
            child: Column(
              children: [
                // Title
                TextTitle(text: 'Fill your personal information'),

                const SizedBox(height: AppSpacing.s24),

                // image profile
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      DottedBorder(
                        options: const CircularDottedBorderOptions(
                          strokeWidth: 0.77,
                          color: AppColors.lightBlue1,
                          dashPattern: [5],
                        ),
                        child: Container(
                          width: AppSpacing.s80,
                          height: AppSpacing.s80,
                          decoration: BoxDecoration(
                            color: AppColors.lightGray1,
                            borderRadius: BorderRadius.circular(
                              AppSpacing.s100,
                            ),
                          ),
                          child: const Icon(
                            Icons.file_upload_outlined,
                            size: AppSpacing.s32,
                            color: AppColors.lightGray5,
                          ),
                        ),
                      ),

                      const SizedBox(height: AppSpacing.s10),

                      Text('Upload photo', style: context.textTheme.bodyMedium),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.s24),

                // Form Fields
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(label: 'Name', hintText: 'Jhon Doe'),

                      const SizedBox(height: AppSpacing.s16),

                      CustomTextFormField(
                        label: 'Email ID',
                        hintText: 'johndoe@email.com',
                      ),

                      const SizedBox(height: AppSpacing.s16),

                      PhoneInputFormField(),

                      const SizedBox(height: AppSpacing.s16),

                      CustomTextFormField(
                        label: 'Country',
                        hintText: 'United Kingdom',
                      ),

                      const SizedBox(height: AppSpacing.s16),

                      CustomTextFormField(label: 'City', hintText: 'Scotland'),

                      const SizedBox(height: AppSpacing.s16),

                      CustomTextFormField(
                        label: 'Tell me about yourself',
                        hintText: 'Type here',
                        isLongText: true,
                        keyboardType: TextInputType.multiline,
                      ),

                      const SizedBox(height: AppSpacing.s16),

                      CustomTextFormField(
                        label: 'Referral Code (Optional)',
                        hintText: 'Enter your referral code',
                      ),

                      const SizedBox(height: AppSpacing.s32),

                      MainButton(onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
