part of 'favorite_card_bloc.dart';

@immutable
abstract class FavoriteCardState {}

abstract class FavoriteCardActionState extends FavoriteCardState {}

class FavoriteCardInitial extends FavoriteCardState {}

class LoadPicturesSuccessState extends FavoriteCardState {
  final List<String> listImgUrl;

  LoadPicturesSuccessState({required this.listImgUrl});

}
