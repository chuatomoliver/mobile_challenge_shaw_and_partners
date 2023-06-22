import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_challenge_shaw_and_partners/models/dog_model.dart';

import '../../data/dog_data.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<FavoriteInitialEvent>(favoriteInitialEvent);

    on<FavoriteLoadSuccessEvent>(favoriteLoadSuccessEvent);
  }

  FutureOr<void> favoriteLoadSuccessEvent(FavoriteLoadSuccessEvent event, Emitter<FavoritesState> emit) {}

  FutureOr<void> favoriteInitialEvent(FavoriteInitialEvent event, Emitter<FavoritesState> emit) {
    emit(FavoriteLoadSuccessState(listFavorites: DogData.listFavorites));
  }
}
