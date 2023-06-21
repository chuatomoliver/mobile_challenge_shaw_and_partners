import 'package:flutter/material.dart';
import 'package:mobile_challenge_shaw_and_partners/blocs/home/home_bloc.dart';
import 'package:mobile_challenge_shaw_and_partners/network/dog_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dog_breed_tile_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeLoadSuccessEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dog"),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          listenWhen: (previous, current) => current is HomeActionState,
          buildWhen: (previous, current) => current is! HomeActionState,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case HomeLoadSuccessState:
                final successState = state as HomeLoadSuccessState;
                print(successState.listDogBreeds.length);
                return ListView.builder(
                    itemCount: successState.listDogBreeds.length,
                    itemBuilder: (context, index) {
                      return DogBreedTileWidget(dogBreedModel: successState.listDogBreeds[index]);
                    });
              default:
                return Container();
            }
          },
        ));
  }
}
