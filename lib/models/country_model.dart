class CountryModel {
  final String name;
  final String capital;
  final String official;
  final String flag;
  final String region;
  final Map<String, String> languages;
  final int population;

  CountryModel(
      {required this.name,
      required this.capital,
      required this.official,
      required this.flag,
      required this.region,
      required this.languages,
      required this.population});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']['common'],
      capital: json['capital'][0],
      official: json['name']['official'],
      flag: json['flags']['png'] ?? json['flags']['svg'],
      region: json['region'],
      languages: Map<String, String>.from(json['languages']),
      population: json['population'],
    );
  }
}
