import 'package:consultant_customer_app/config/routes/routes.dart';
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
  UserCategory? _selectedCategory;

  void _continueToPersonalInfo() {
    final selectedCategory = _selectedCategory;

    if (selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select customer or consultant')),
      );
      return;
    }

    Navigator.pushNamed(
      context,
      Routes.personalInfoScreen,
      arguments: selectedCategory,
    );
  }

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
                title: 'I am a Customer',
                subtitle: 'Search your best consultant around the world',
                assetSvgString: SvgAssets.customerThinking,
                isSelected: _selectedCategory == UserCategory.customer,
                onTap: () {
                  setState(() {
                    _selectedCategory = UserCategory.customer;
                  });
                },
              ),

              const SizedBox(height: AppSpacing.s12),

              CategorySelectionCard(
                title: 'I am a Consultant',
                subtitle: 'Search your best consultant around the world',
                assetSvgString: SvgAssets.consultantThinking,
                isSelected: _selectedCategory == UserCategory.consultant,
                onTap: () {
                  setState(() {
                    _selectedCategory = UserCategory.consultant;
                  });
                },
              ),

              const Spacer(),

              MainButton(onPressed: _continueToPersonalInfo),
            ],
          ),
        ),
      ),
    );
  }
}
