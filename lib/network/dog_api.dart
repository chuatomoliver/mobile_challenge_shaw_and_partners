import 'package:dio/dio.dart';
import 'package:mobile_challenge_shaw_and_partners/data/dog_data.dart';
import 'package:mobile_challenge_shaw_and_partners/models/dog_model.dart';

class DogAPI {

  Future<List<DogBreedModel>> getAllDogBreed() async {
    List<DogBreedModel> listDogBreed = [];
    try {
      Dio dio = Dio();
      Response response = await dio.get('https://dog.ceo/api/breeds/list/all');

      if (response.statusCode == 200) {
        Map<String, dynamic> message = response.data['message'];
        List<String> properties = message.keys.toList();

        /// Convert return to object
        for (var breed in properties) {
          List<String> listBreedTypes =  List<String>.from(message[breed]);
          listDogBreed.add(DogBreedModel(breed: breed, listBreedTypes: listBreedTypes));
        }

      } else {
        throw 'Error: ${response.statusCode}';
      }
    } catch (e) {
      print('Error: $e');
    }
    return listDogBreed;
  }
}