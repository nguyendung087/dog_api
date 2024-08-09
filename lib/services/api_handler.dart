import 'dart:convert';

import 'package:dog_api/models/dog.dart';
import 'package:http/http.dart' as http;

class APIHandler {
  static Future<List<Dog>> getDogs() async {
    var url = Uri.parse(
        'https://api.thedogapi.com/v1/images/search?api_key=live_IzwLd9igTIr8ayqQviCtAxXEDN81sFaIQJ55WVHxVw99lKzn7ovYWYVw9Ar2tG6E&size=med&mime_types=jpg&format=json&has_breeds=true&order=desc&limit=20');
    try {
      final response = await http.get(url);
      final List<dynamic> extractedData = json.decode(response.body);
      final List<Dog> loadedDogs = [];

      if (extractedData.isNotEmpty) {
        for (var dogData in extractedData) {
          var breedsData = dogData['breeds'] as List<dynamic>;
          List<Breed> breedsList = breedsData.map((breedData) {
            return Breed(
              id: breedData['id'],
              name: breedData['name'] ?? '',
              countryCode: breedData['country_code'] ?? '',
              bredFor: breedData['bred_for'] ?? '',
              breedGroup: breedData['breed_group'] ?? '',
              lifeSpan: breedData['life_span'] ?? '',
              temperament: breedData['temperament'] ?? '',
              weight: Weight(
                imperial: breedData['weight']['imperial'] ?? '',
                metric: breedData['weight']['metric'] ?? '',
              ),
              height: Height(
                imperial: breedData['height']['imperial'] ?? '',
                metric: breedData['height']['metric'] ?? '',
              ),
            );
          }).toList();

          loadedDogs.add(Dog(
            id: dogData['id'] ?? '',
            url: dogData['url'] ?? '',
            breeds: breedsList,
          ));
        }

        return loadedDogs;
        // print(loadedDogs[0].breeds.first.name);
      }
      return loadedDogs;
    } catch (error) {
      // ignore: use_rethrow_when_possible
      throw error;
    }
  }
}
