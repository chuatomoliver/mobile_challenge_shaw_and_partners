import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_challenge_shaw_and_partners/blocs/favorites/favorites_bloc.dart';
import 'package:mobile_challenge_shaw_and_partners/screens/favorites/favorite_tile_widget.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavoritesBloc favoritesBloc = FavoritesBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favoritesBloc.add(FavoriteInitialEvent());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.green),
        titleSpacing: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "Favorites",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      body: BlocConsumer<FavoritesBloc, FavoritesState>(
        bloc: favoritesBloc,
        listenWhen: (previous, current) => current is FavoriteActionState,
        buildWhen: (previous, current) => current is! FavoriteActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case FavoriteLoadSuccessState:
              final successState = state as FavoriteLoadSuccessState;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: ListView.builder(
                    itemCount: successState.listFavorites.length,
                    itemBuilder: (context, index) {
                      return FavoriteTile(
                        dogBreedModel: successState.listFavorites[index],
                        favoritesBloc: favoritesBloc,
                      );
                    }),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
