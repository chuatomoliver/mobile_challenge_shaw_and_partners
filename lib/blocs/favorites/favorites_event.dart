part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesEvent {}

class FavoriteInitialEvent extends FavoritesEvent {}

class FavoriteLoadSuccessEvent extends FavoritesEvent {}
