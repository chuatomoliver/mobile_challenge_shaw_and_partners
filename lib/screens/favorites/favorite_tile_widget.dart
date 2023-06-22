import 'package:flutter/material.dart';
import 'package:mobile_challenge_shaw_and_partners/blocs/favorites/favorites_bloc.dart';
import 'package:mobile_challenge_shaw_and_partners/models/dog_model.dart';

class FavoriteTile extends StatelessWidget {
  final DogBreedModel dogBreedModel;
  final FavoritesBloc favoritesBloc;

  const FavoriteTile({Key? key, required this.dogBreedModel, required this.favoritesBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: InkWell(
        splashColor: Colors.lightGreen,
        onTap: () {
          //homeBloc.add(HomeDogBreedCardClickedEvent(clickedDog: dogBreedModel));
        },
        child: Container(
          //color: Colors.red,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/dog_cartoon_2.png',
                width: 80,
                height: 100,
                fit: BoxFit.fill,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${dogBreedModel.breed} ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  for (var item in dogBreedModel.listBreedTypes)
                    Text(
                      item,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    // homeBloc.add(HomeDogCardFavoriteClickedEvent(clickedDog: dogBreedModel));
                  },
                  icon: Icon(Icons.favorite_border)),
            ],
          ),
        ),
      ),
    );
  }
}
