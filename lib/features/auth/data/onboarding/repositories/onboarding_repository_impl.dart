import 'package:consultant_customer_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../domain/entities/onboarding_item_entity.dart';
import '../../../domain/repositories/onboarding_repository.dart';
import '../data_source/local/onboarding_local_data_source.dart';
import '../mappers/onboarding_item_mapper.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource dataSource;
  final OnboardingItemMapper mapper;

  OnboardingRepositoryImpl({required this.dataSource, required this.mapper});

  @override
  Either<Failure, List<OnboardingItemEntity>> getOnboardingItems() {
    try {
      final models = dataSource.getItems();
      final entities = mapper.toEntityList(models);
      return Right(entities);
    } on AssetException catch (e) {
      return Left(AssetFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
