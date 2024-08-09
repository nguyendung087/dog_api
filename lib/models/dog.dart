class Dog {
  final String id;
  final String url;
  final List<Breed> breeds;

  Dog({
    required this.id,
    required this.url,
    required this.breeds,
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    var breedsFromJson = json['breeds'] as List;
    List<Breed> breedList =
        breedsFromJson.map((breed) => Breed.fromJson(breed)).toList();

    return Dog(
      id: json['id'],
      url: json['url'],
      breeds: breedList,
    );
  }
}

class Breed {
  final int id;
  final String name;
  final String countryCode;
  final String bredFor;
  final String breedGroup;
  final String lifeSpan;
  final String temperament;
  final Weight weight;
  final Height height;

  Breed({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.bredFor,
    required this.breedGroup,
    required this.lifeSpan,
    required this.temperament,
    required this.weight,
    required this.height,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      id: json['id'],
      name: json['name'],
      countryCode: json['country_code'] ?? '',
      bredFor: json['bred_for'] ?? '',
      breedGroup: json['breed_group'] ?? '',
      lifeSpan: json['life_span'],
      temperament: json['temperament'],
      weight: Weight.fromJson(json['weight']),
      height: Height.fromJson(json['height']),
    );
  }
}

class Weight {
  final String imperial;
  final String metric;

  Weight({
    required this.imperial,
    required this.metric,
  });

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      imperial: json['imperial'],
      metric: json['metric'],
    );
  }
}

class Height {
  final String imperial;
  final String metric;

  Height({
    required this.imperial,
    required this.metric,
  });

  factory Height.fromJson(Map<String, dynamic> json) {
    return Height(
      imperial: json['imperial'],
      metric: json['metric'],
    );
  }
}
