part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesState {}

abstract class FavoriteActionState extends FavoritesState {}

/// FavoritesState
class FavoritesInitial extends FavoritesState {}

class FavoriteLoadSuccessState extends FavoritesState{
  final List<DogBreedModel> listFavorites;

  FavoriteLoadSuccessState({required this.listFavorites});

}
/// FavoriteActionState

