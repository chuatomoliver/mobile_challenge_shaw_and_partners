part of 'favorite_card_bloc.dart';

@immutable
abstract class FavoriteCardEvent {}

class FavoriteCardInitialEvent extends FavoriteCardEvent {
  final DogBreedModel dogBreedModel;

  FavoriteCardInitialEvent({required this.dogBreedModel});
}

class LoadPicturesSuccessEvent extends FavoriteCardEvent {
  final List<String> listImgUrl;

  LoadPicturesSuccessEvent({required this.listImgUrl});
}
