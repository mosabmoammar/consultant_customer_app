class CountryModel {
  final String name;
  final String dialCode;
  final String code;
  final String flag;

  const CountryModel({
    required this.name,
    required this.dialCode,
    required this.code,
    required this.flag,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'dial_code': dialCode,
      'code': code,
      'flag': flag,
    };
  }

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'] as String,
      dialCode: json['dial_code'] as String,
      code: json['code'] as String,
      flag: json['flag'] as String,
    );
  }
}
