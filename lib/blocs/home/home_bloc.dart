import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_challenge_shaw_and_partners/network/dog_api.dart';

import '../../models/dog_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeLoadSuccessEvent>(homeLoadSuccessEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {}

  FutureOr<void> homeLoadSuccessEvent(HomeLoadSuccessEvent event, Emitter<HomeState> emit) async {
    List<DogBreedModel> listDogBreeds = await DogAPI().getAllDogBreed();
    emit(HomeLoadSuccessState(listDogBreeds: listDogBreeds));
  }
}
