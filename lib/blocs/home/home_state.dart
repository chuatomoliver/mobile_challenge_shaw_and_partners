part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeInitialState extends HomeState {

}

class HomeLoadSuccessState extends HomeState {
  final List<DogBreedModel> listDogBreeds;

  HomeLoadSuccessState({required this.listDogBreeds});
}
