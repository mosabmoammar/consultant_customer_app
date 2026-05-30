import 'package:consultant_customer_app/features/customer/select_interest/presentation/widgets/interest_item.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme/app_spacing.dart';
import '../../../../../core/constants/assets_manager/image_assets.dart';
import '../../../../../core/widgets/icon_button_back_arrow.dart';
import '../../../../../core/widgets/text_title.dart';

class SelectInterestScreen extends StatefulWidget {
  const SelectInterestScreen({super.key});

  @override
  State<SelectInterestScreen> createState() => _SelectInterestScreenState();
}

class _SelectInterestScreenState extends State<SelectInterestScreen> {
  final List<Map<String, String>> _listOfItem = [
    {'imagePath': ImageAssets.astrologer, 'text': 'Astrologer'},
    {'imagePath': ImageAssets.doctor, 'text': 'Doctor'},
    {'imagePath': ImageAssets.financialAdvisor, 'text': 'Financial Advisor'},
    {'imagePath': ImageAssets.lawyer, 'text': 'Lawyer'},
    {'imagePath': ImageAssets.psychologist, 'text': 'Psychologist'},
    {'imagePath': ImageAssets.realEstate, 'text': 'Real Estate'},
    {'imagePath': ImageAssets.tutors, 'text': 'Tutors'},
    {'imagePath': ImageAssets.youtubers, 'text': 'Youtubers'},
  ];
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
                const TextTitle(text: 'What type of consultant do you need?'),

                const SizedBox(height: AppSpacing.s24),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _listOfItem.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final item = _listOfItem[index];
                    return InterestItem(
                      imageAsset: item['imagePath']!,
                      text: item['text']!,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
