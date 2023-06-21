class DogBreedModel {
  final String breed;
  final List<String> listBreedTypes;

  DogBreedModel({required this.breed, required this.listBreedTypes});

  factory DogBreedModel.fromJson(Map<String, dynamic> json) => DogBreedModel(
        breed: json[""],
    listBreedTypes: json['breedTypes'],
      );
}
