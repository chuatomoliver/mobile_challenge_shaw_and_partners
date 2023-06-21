part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeLoadSuccessEvent extends HomeEvent {}

class HomeDogBreedCardClickedEvent extends HomeEvent {
  final DogBreedModel clickedDog;

  HomeDogBreedCardClickedEvent({required this.clickedDog});
}
