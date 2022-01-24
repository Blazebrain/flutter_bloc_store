import 'dart:convert';

import 'package:flutter_bloc_store/features/superheroes/data/models/character_model.dart';
import 'package:flutter_bloc_store/features/superheroes/data/models/response_model.dart';
import 'package:flutter_bloc_store/features/superheroes/data/providers/superhero_provider.dart';

class SuperheroRepository {
  SuperheroProvider? superheroProvider;
  SuperheroRepository({required this.superheroProvider});

  Future<List<CharacterModel>?> getSuperheroes() async {
    try {
      final results = await superheroProvider?.getSuperheroes();
      if (results?.statusCode == 200) {
        final decodedResponse =
            CharacterResponseModel.fromJson(json.decode(results!.body));
        return decodedResponse.results;
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
