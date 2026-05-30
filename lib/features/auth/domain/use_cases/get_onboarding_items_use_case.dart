import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/onboarding_item_entity.dart';
import '../repositories/onboarding_repository.dart';

class GetOnboardingItemsUseCase
    implements SyncUseCase<List<OnboardingItemEntity>, NoParams> {
  final OnboardingRepository repository;

  GetOnboardingItemsUseCase({required this.repository});
  @override
  Either<Failure, List<OnboardingItemEntity>> call(NoParams params) {
    return repository.getOnboardingItems();
  }
}
