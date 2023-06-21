part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

abstract class HomeActionState extends HomeState {}

class HomeInitialEvent extends HomeEvent {}

class HomeLoadSuccessEvent extends HomeEvent {}
