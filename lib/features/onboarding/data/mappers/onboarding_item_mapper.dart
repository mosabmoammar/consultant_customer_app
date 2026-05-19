import '../../domain/entities/onboarding_item_entity.dart';
import '../models/onboarding_item_model.dart';

class OnboardingItemMapper {
  const OnboardingItemMapper();

  OnboardingItemEntity toEntity(OnboardingItemModel model) =>
      OnboardingItemEntity(
        imagePath: model.imagePath,
        title: model.title,
        subtitle: model.subtitle,
      );

  OnboardingItemModel toModel(OnboardingItemEntity entity) =>
      OnboardingItemModel(
        imagePath: entity.imagePath,
        title: entity.title,
        subtitle: entity.subtitle,
      );

  List<OnboardingItemEntity> toEntityList(List<OnboardingItemModel> models) =>
      models.map(toEntity).toList();

  List<OnboardingItemModel> toModelList(List<OnboardingItemEntity> entities) =>
      entities.map(toModel).toList();
}
