import 'package:consultant_customer_app/core/constants/assets_manager/image_assets.dart';
import 'package:consultant_customer_app/core/errors/exceptions.dart';
import 'package:consultant_customer_app/features/onboarding/data/models/onboarding_item_model.dart';

abstract class OnboardingLocalDataSource {
  List<OnboardingItemModel> getItems();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  @override
  List<OnboardingItemModel> getItems() {
    try {
      return const [
        OnboardingItemModel(
          imagePath: ImageAssets.onboarding,
          title: 'Discover Your Ideal\nConsultant',
          subtitle:
              'Diverse range of categories and connect\nwith experienced consultants',
        ),
        OnboardingItemModel(
          imagePath: ImageAssets.onboarding,
          title: 'Book a Session\nInstantly',
          subtitle:
              'Schedule a meeting in seconds with\nour smart booking system',
        ),
        OnboardingItemModel(
          imagePath: ImageAssets.onboarding,
          title: 'Grow With Expert\nGuidance',
          subtitle:
              'Get personalized advice from top\nprofessionals in every field',
        ),
      ];
    } catch (e) {
      throw AssetException(message: 'Failed to load onboarding data : $e');
    }
  }
}
