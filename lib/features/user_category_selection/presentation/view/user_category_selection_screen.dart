import 'package:consultant_customer_app/core/constants/assets_manager/svg_assets.dart';
import 'package:consultant_customer_app/core/widgets/main_button.dart';
import 'package:consultant_customer_app/core/widgets/text_title.dart';
import 'package:consultant_customer_app/features/user_category_selection/presentation/widgets/category_selection_card.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/app_spacing.dart';
import '../../../../core/widgets/icon_button_back_arrow.dart';

class UserCategorySelectionScreen extends StatefulWidget {
  const UserCategorySelectionScreen({super.key});

  @override
  State<UserCategorySelectionScreen> createState() =>
      _UserCategorySelectionScreenState();
}

class _UserCategorySelectionScreenState
    extends State<UserCategorySelectionScreen> {
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const IconButtonBackArrow(),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.s16),
          child: Column(
            children: [
              TextTitle(
                text:
                    'Tell us who you are and how you\'d like to engage with the app',
              ),

              const SizedBox(height: AppSpacing.s32),

              CategorySelectionCard(
                title: 'I am looking for Consultant',
                subtitle: 'Search your best consultant around the world',
                assetSvgString: SvgAssets.customerThinking,
                isSelected: _selectedCategoryIndex == 0,
                onTap: () {
                  setState(() {
                    _selectedCategoryIndex = 0;
                  });
                },
              ),

              const SizedBox(height: AppSpacing.s12),

              CategorySelectionCard(
                title: 'I am a Consultant Provider',
                subtitle: 'Search your best consultant around the world',
                assetSvgString: SvgAssets.consultantThinking,
                isSelected: _selectedCategoryIndex == 1,
                onTap: () {
                  setState(() {
                    _selectedCategoryIndex = 1;
                  });
                },
              ),

              const Spacer(),

              MainButton(onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
