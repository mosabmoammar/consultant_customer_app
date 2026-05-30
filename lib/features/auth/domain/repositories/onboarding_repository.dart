import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/onboarding_item_entity.dart';

abstract class OnboardingRepository {
  Either<Failure, List<OnboardingItemEntity>> getOnboardingItems();
}
