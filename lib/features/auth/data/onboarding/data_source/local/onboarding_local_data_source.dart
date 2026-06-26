import 'package:consultant_customer_app/core/constants/assets_manager/image_assets.dart';
import 'package:consultant_customer_app/core/errors/exceptions.dart';

import '../../models/onboarding_item_model.dart';

abstract class OnboardingLocalDataSource {
  List<OnboardingItemModel> getItems();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  const OnboardingLocalDataSourceImpl();
  
  @override
  List<OnboardingItemModel> getItems() {
    try {
      return const [
        OnboardingItemModel(
          imagePath: ImageAssets.onboarding,
          title: 'Discover Your Ideal Consultant',
          subtitle:
              'Diverse range of categories and connect with experienced consultants',
        ),
        OnboardingItemModel(
          imagePath: ImageAssets.onboarding,
          title: 'Instant Bookings,Hassle-Free',
          subtitle:
              'You can easily book video or audio calls with your chosen consultant ',
        ),
        OnboardingItemModel(
          imagePath: ImageAssets.onboarding,
          title: 'Secure Payments for Peace of Mind',
          subtitle:
              'Make payments with confidence, knowing that your information is well-protected',
        ),
      ];
    } catch (e) {
      throw AssetException(message: 'Failed to load onboarding data : $e');
    }
  }
}
