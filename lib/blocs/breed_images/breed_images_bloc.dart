import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_challenge_shaw_and_partners/data/dog_data.dart';
import 'package:mobile_challenge_shaw_and_partners/network/dog_api.dart';

part 'breed_images_event.dart';

part 'breed_images_state.dart';

class BreedImagesBloc extends Bloc<BreedImagesEvent, BreedImagesState> {
  BreedImagesBloc() : super(BreedImagesInitial()) {
   /* on<BreedImagesEvent>((event, emit) {
      // TODO: implement event handler
    });*/

    on<BreedImagesInitialEvent>(breedImagesInitialEvent);
    on<BreedImagesLoadSuccessEvent>(breedImagesLoadSuccessEvent);

  }

  FutureOr<void> breedImagesLoadSuccessEvent(BreedImagesLoadSuccessEvent event, Emitter<BreedImagesState> emit) {

  }

  FutureOr<void> breedImagesInitialEvent(BreedImagesInitialEvent event, Emitter<BreedImagesState> emit) async {
    List<String> listImgUrl = await DogAPI().getDogBreedImages(DogData.selectedDogBreed);
    emit(BreedImagesLoadSuccessState(listImgUrl: listImgUrl));
  }
}
