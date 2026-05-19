import '../models/country_model.dart';
import '../../domain/entities/country_entity.dart';

class CountryMapper {
  const CountryMapper();

  CountryEntity toEntity(CountryModel model) => CountryEntity(
    name: model.name,
    dialCode: model.dialCode,
    code: model.code,
    flag: model.flag,
  );

  CountryModel toModel(CountryEntity entity) => CountryModel(
    name: entity.name,
    dialCode: entity.dialCode,
    code: entity.code,
    flag: entity.flag,
  );

  List<CountryEntity> toEntityList(List<CountryModel> models) =>
      models.map(toEntity).toList();

  List<CountryModel> toModelList(List<CountryEntity> entities) =>
      entities.map(toModel).toList();
}
