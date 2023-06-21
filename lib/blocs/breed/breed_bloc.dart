import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'breed_event.dart';
part 'breed_state.dart';

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  BreedBloc() : super(BreedInitial()) {
    on<BreedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
