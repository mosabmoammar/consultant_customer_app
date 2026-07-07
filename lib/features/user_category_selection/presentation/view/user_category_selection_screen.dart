import 'package:consultant_customer_app/config/routes/routes.dart';
import 'package:consultant_customer_app/core/constants/assets_manager/svg_assets.dart';
import 'package:consultant_customer_app/core/shared/widgets/main_button.dart';
import 'package:consultant_customer_app/core/shared/widgets/text_title.dart';
import 'package:consultant_customer_app/core/utils/toast_message.dart';
import 'package:consultant_customer_app/features/user_category_selection/presentation/widgets/category_selection_card.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/app_spacing.dart';
import '../../../../core/constants/enum/user_category.dart';
import '../../../../core/shared/widgets/icon_button_back_arrow.dart';

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
      showToast(
        message: 'Please select customer or consultant',
        type: ToastType.warning,
      );
      return;
    }

    if (selectedCategory == UserCategory.customer) {
      Navigator.pushNamed(
        context,
        Routes.personalInfoScreen,
        arguments: selectedCategory,
      );
    } else if (selectedCategory == UserCategory.consultant) {
      Navigator.pushNamed(
        context,
        Routes.personalInfoScreen,
        arguments: selectedCategory,
      );
    }
  }

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
            children: [
              const TextTitle(
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
