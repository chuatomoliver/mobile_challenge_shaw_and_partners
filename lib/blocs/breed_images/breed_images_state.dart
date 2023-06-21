part of 'breed_images_bloc.dart';

@immutable
abstract class BreedImagesState {}

abstract class BreedImagesActionState {}

class BreedImagesInitial extends BreedImagesState {}

class BreedImagesLoadingState extends BreedImagesState {}

class BreedImagesLoadSuccessState extends BreedImagesState {
  final List<String> listImgUrl;

  BreedImagesLoadSuccessState({required this.listImgUrl});

}