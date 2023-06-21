import 'package:flutter/material.dart';
import 'package:mobile_challenge_shaw_and_partners/blocs/home/home_bloc.dart';
import 'package:mobile_challenge_shaw_and_partners/network/dog_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_challenge_shaw_and_partners/screens/breed_images/breed_images_screen.dart';

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            "Dog Breed List",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          ),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          listenWhen: (previous, current) => current is HomeActionState,
          buildWhen: (previous, current) => current is! HomeActionState,
          listener: (context, state) {
            if (state is HomeNavigateToBreedImagesActionState) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BreedImagesScreen()));
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case HomeLoadSuccessState:
                final successState = state as HomeLoadSuccessState;
                print(successState.listDogBreeds.length);
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ListView.builder(
                      itemCount: successState.listDogBreeds.length,
                      itemBuilder: (context, index) {
                        return DogBreedTileWidget(
                          dogBreedModel: successState.listDogBreeds[index],
                          homeBloc: homeBloc,
                        );
                      }),
                );
              default:
                return Container();
            }
          },
        ));
  }
}
