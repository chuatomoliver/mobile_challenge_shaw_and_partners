import 'package:flutter/material.dart';
import 'package:mobile_challenge_shaw_and_partners/models/dog_model.dart';

class DogBreedTileWidget extends StatelessWidget {
  final DogBreedModel dogBreedModel;

  const DogBreedTileWidget({Key? key, required this.dogBreedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${dogBreedModel.breed} ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            for (var item in dogBreedModel.listBreedTypes)
              Text(
                item,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
