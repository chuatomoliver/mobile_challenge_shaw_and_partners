part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeInitialState extends HomeState {}

/// HomeState
class HomeLoadSuccessState extends HomeState {
  final List<DogBreedModel> listDogBreeds;

  HomeLoadSuccessState({required this.listDogBreeds});
}

/// HomeActionState
class HomeNavigateToBreedImagesActionState extends HomeActionState {}
class HomeNavigateToFavoritesActionState extends HomeActionState {}
