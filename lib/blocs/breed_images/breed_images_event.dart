part of 'breed_images_bloc.dart';

@immutable
abstract class BreedImagesEvent {}

class BreedImagesInitialEvent extends BreedImagesEvent {}

class BreedImagesLoadSuccessEvent extends BreedImagesEvent {
  final List<String> listImgUrl;

  BreedImagesLoadSuccessEvent({required this.listImgUrl});

}