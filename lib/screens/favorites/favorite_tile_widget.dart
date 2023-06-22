import 'package:flutter/material.dart';
import 'package:mobile_challenge_shaw_and_partners/blocs/favorite_card/favorite_card_bloc.dart';
import 'package:mobile_challenge_shaw_and_partners/blocs/favorites/favorites_bloc.dart';
import 'package:mobile_challenge_shaw_and_partners/models/dog_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteTile extends StatefulWidget {
  final DogBreedModel dogBreedModel;
  final FavoritesBloc favoritesBloc;

  const FavoriteTile({Key? key, required this.dogBreedModel, required this.favoritesBloc}) : super(key: key);

  @override
  State<FavoriteTile> createState() => _FavoriteTileState();
}

class _FavoriteTileState extends State<FavoriteTile> {
  final FavoriteCardBloc favoritesBloc = FavoriteCardBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetch list of img urls
    favoritesBloc.add(FavoriteCardInitialEvent(dogBreedModel: widget.dogBreedModel));
  }

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
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          //  height: 200.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.dogBreedModel.breed} ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 20.0),
              BlocConsumer<FavoriteCardBloc, FavoriteCardState>(
                bloc: favoritesBloc,
                listenWhen: (previous, current) => current is FavoriteCardActionState,
                buildWhen: (previous, current) => current is! FavoriteActionState,
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case LoadPicturesSuccessState:
                      final successState = state as LoadPicturesSuccessState;

                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: successState.listImgUrl.length > 5 ? 5 : successState.listImgUrl.length,
                          itemBuilder: (context, index) {
                            return Image.network(
                              successState.listImgUrl[index],
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                          });

                    default:
                      return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
