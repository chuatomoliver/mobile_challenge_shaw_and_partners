import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_challenge_shaw_and_partners/models/dog_model.dart';
import 'package:mobile_challenge_shaw_and_partners/network/dog_api.dart';

part 'favorite_card_event.dart';
part 'favorite_card_state.dart';

class FavoriteCardBloc extends Bloc<FavoriteCardEvent, FavoriteCardState> {
  FavoriteCardBloc() : super(FavoriteCardInitial()) {
    on<FavoriteCardInitialEvent>(favoriteCardInitialEvent);

    on<FavoriteCardEvent>(favoriteCardEvent);
    
    on<LoadPicturesSuccessEvent>(loadPicturesSuccessEvent);
  }

  FutureOr<void> loadPicturesSuccessEvent(LoadPicturesSuccessEvent event, Emitter<FavoriteCardState> emit) {
    emit(LoadPicturesSuccessState(listImgUrl: event.listImgUrl));
  }

  FutureOr<void> favoriteCardEvent(FavoriteCardEvent event, Emitter<FavoriteCardState> emit) {
  }

  FutureOr<void> favoriteCardInitialEvent(FavoriteCardInitialEvent event, Emitter<FavoriteCardState> emit) async {
    List<String> listImgUrl = await DogAPI().getDogBreedImages(event.dogBreedModel);
    emit(LoadPicturesSuccessState(listImgUrl: listImgUrl));
  }
}
