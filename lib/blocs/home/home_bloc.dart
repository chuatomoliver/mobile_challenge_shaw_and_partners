import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_challenge_shaw_and_partners/data/dog_data.dart';
import 'package:mobile_challenge_shaw_and_partners/network/dog_api.dart';

import '../../models/dog_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeLoadSuccessEvent>(homeLoadSuccessEvent);

    on<HomeDogBreedCardClickedEvent>(homeDogBreedCardClickedEvent);

    on<HomeFavoriteClickedEvent>(homeFavoriteClickedEvent);

    on<HomeDogCardFavoriteClickedEvent>(homeDogCardFavoriteClickedEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {}

  FutureOr<void> homeLoadSuccessEvent(HomeLoadSuccessEvent event, Emitter<HomeState> emit) async {
    List<DogBreedModel> listDogBreeds = await DogAPI().getAllDogBreed();
    emit(HomeLoadSuccessState(listDogBreeds: listDogBreeds));
  }

  FutureOr<void> homeDogBreedCardClickedEvent(HomeDogBreedCardClickedEvent event, Emitter<HomeState> emit) {
    DogData.selectedDogBreed = event.clickedDog;
    emit(HomeNavigateToBreedImagesActionState());
  }

  FutureOr<void> homeFavoriteClickedEvent(HomeFavoriteClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToFavoritesActionState());
  }

  FutureOr<void> homeDogCardFavoriteClickedEvent(HomeDogCardFavoriteClickedEvent event, Emitter<HomeState> emit) {
    DogData.listFavorites.add(event.clickedDog);
    print("List Favorites: ${DogData.listFavorites.length}");
  }
}
