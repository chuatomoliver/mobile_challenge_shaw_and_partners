import 'package:flutter/material.dart';
import 'package:mobile_challenge_shaw_and_partners/screens/breed_images/breed_image_tile_widget.dart';

import '../../blocs/breed_images/breed_images_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedImagesScreen extends StatefulWidget {
  const BreedImagesScreen({Key? key}) : super(key: key);

  @override
  State<BreedImagesScreen> createState() => _BreedImagesScreenState();
}

class _BreedImagesScreenState extends State<BreedImagesScreen> {
  final BreedImagesBloc breedImagesBloc = BreedImagesBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    breedImagesBloc.add(BreedImagesInitialEvent());
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
          "Images",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      body: BlocConsumer<BreedImagesBloc, BreedImagesState>(
        bloc: breedImagesBloc,
        listenWhen: (previous, current) => current is BreedImagesActionState,
        buildWhen: (previous, current) => current is! BreedImagesActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case BreedImagesLoadSuccessState:
              final successState = state as BreedImagesLoadSuccessState;
              print(successState.listImgUrl.length);
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: ListView.builder(
                    itemCount: successState.listImgUrl.length,
                    itemBuilder: (context, index) {
                      return BreedImageTile(
                        imgUrl: successState.listImgUrl[index],
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
