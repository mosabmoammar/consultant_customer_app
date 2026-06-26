import 'package:consultant_customer_app/config/routes/routes.dart';
import 'package:consultant_customer_app/core/common/mock_data/mock_data.dart';
import 'package:consultant_customer_app/core/widgets/main_button.dart';
import 'package:consultant_customer_app/features/customer/select_interest/presentation/widgets/interest_item.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme/app_spacing.dart';
import '../../../../../core/widgets/icon_button_back_arrow.dart';
import '../../../../../core/widgets/text_title.dart';

class SelectInterestScreen extends StatefulWidget {
  const SelectInterestScreen({super.key});

  @override
  State<SelectInterestScreen> createState() => _SelectInterestScreenState();
}

class _SelectInterestScreenState extends State<SelectInterestScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const IconButtonBackArrow(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const TextTitle(text: 'What type of consultant do you need?'),

              const SizedBox(height: AppSpacing.s24),
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: GridView.builder(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        itemCount: MockData.jobCategories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: AppSpacing.s16,
                              mainAxisSpacing: AppSpacing.s24,
                            ),

                        itemBuilder: (context, index) {
                          final item = MockData.jobCategories[index];

                          return InterestItem(
                            imageAsset: item['imagePath']!,
                            text: item['text']!,
                            isSelected: selectedIndex == index,
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          );
                        },
                      ),
                    ),

                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      bottom: 0.0,
                      child: IgnorePointer(
                        ignoring: true,
                        child: Container(
                          height: AppSpacing.s32,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white.withAlpha(0), Colors.white],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              MainButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.customerMainScreen,
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
