class DogModel {
  final String breed;
  final List<String> breedTypes;

  DogModel({required this.breed, required this.breedTypes});

  factory DogModel.fromJson(Map<String, dynamic> json) => DogModel(
        breed: json[""],
        breedTypes: json['breedTypes'],
      );
}
